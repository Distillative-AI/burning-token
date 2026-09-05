// Linkup Search API client.
//
// Follows the query-construction rules in .claude/skills/linkup-search/SKILL.md
// and .claude/skills/linkup-workflow/SKILL.md:
//   - depth is chosen per-query based on where the data lives (fast/standard/deep),
//     never defaulted blindly to "deep".
//   - outputType is `searchResults` here because the app inspects/synthesizes the
//     sources itself (jurisdiction eligibility + gap detection) rather than asking
//     Linkup for a single prose answer.
//   - queries are written as retrieval plans (what to find, where, what fields to
//     return, "cite source URLs"), not bare questions.
//   - date filters (fromDate) are used for "recent ordinance/ballot changes" queries
//     since the brief specifies a 12-month recency window.

export type LinkupDepth = 'standard' | 'deep';
export type LinkupOutputType = 'searchResults' | 'sourcedAnswer' | 'structured';

export interface LinkupSearchRequest {
  q: string;
  depth: LinkupDepth;
  outputType: LinkupOutputType;
  includeDomains?: string[];
  excludeDomains?: string[];
  fromDate?: string; // YYYY-MM-DD
  toDate?: string;
}

export interface LinkupSourceResult {
  type: 'text' | string;
  name?: string;
  url?: string;
  content?: string;
  snippet?: string;
}

export interface LinkupSearchResponse {
  results?: LinkupSourceResult[];
  answer?: string;
  sources?: LinkupSourceResult[];
  [key: string]: unknown;
}

export class LinkupConfigError extends Error {}
export class LinkupApiError extends Error {
  status: number;
  body: string;
  constructor(status: number, body: string) {
    super(`Linkup API error ${status}: ${body}`);
    this.status = status;
    this.body = body;
  }
}

const LINKUP_ENDPOINT = 'https://api.linkup.so/v1/search';

export function getLinkupApiKey(): string {
  const key = process.env.LINKUP_API_KEY;
  if (!key) {
    throw new LinkupConfigError(
      'LINKUP_API_KEY is not set. This app requires a live Linkup API key (pending as of the initial build) — ' +
        'set it in app/.env.local as LINKUP_API_KEY=... and restart the dev server. ' +
        'See app/README.md for how to verify once the key lands.'
    );
  }
  return key;
}

export async function linkupSearch(req: LinkupSearchRequest): Promise<LinkupSearchResponse> {
  const apiKey = getLinkupApiKey();

  const body: Record<string, unknown> = {
    q: req.q,
    depth: req.depth,
    outputType: req.outputType,
  };
  if (req.includeDomains?.length) body.includeDomains = req.includeDomains;
  if (req.excludeDomains?.length) body.excludeDomains = req.excludeDomains;
  if (req.fromDate) body.fromDate = req.fromDate;
  if (req.toDate) body.toDate = req.toDate;

  const res = await fetch(LINKUP_ENDPOINT, {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${apiKey}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(body),
  });

  const text = await res.text();
  if (!res.ok) {
    throw new LinkupApiError(res.status, text);
  }

  try {
    return JSON.parse(text) as LinkupSearchResponse;
  } catch {
    // Non-JSON body on a 2xx is unexpected but shouldn't crash the pipeline.
    return { answer: text };
  }
}

/** 12-months-ago date in YYYY-MM-DD, for "recent changes" fromDate filters. */
export function twelveMonthsAgoISODate(): string {
  const d = new Date();
  d.setFullYear(d.getFullYear() - 1);
  return d.toISOString().slice(0, 10);
}
