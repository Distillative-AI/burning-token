// Turns a raw Linkup searchResults response into structured findings rows.
// This is intentionally simple/heuristic (regex + keyword scoring), not an
// LLM call, so the pipeline stays inspectable and cheap. Each Linkup result
// item becomes zero or more findings tagged with a topic bucket.

import { LinkupSearchResponse, LinkupSourceResult } from './linkup';

export type Topic =
  | 'housing_element_compliance'
  | 'sb9'
  | 'sb35'
  | 'sb10'
  | 'builders_remedy'
  | 'recent_ordinance'
  | 'other';

export interface ExtractedFinding {
  claim: string;
  topic: Topic;
  source_url: string | null;
  source_name: string | null;
  confidence: 'high' | 'medium' | 'low';
}

const TOPIC_KEYWORDS: Record<Exclude<Topic, 'other'>, string[]> = {
  housing_element_compliance: ['housing element', 'hcd', 'compliant', 'non-compliant', 'certified'],
  sb9: ['sb9', 'sb 9', 'senate bill 9', 'lot split', 'duplex'],
  sb35: ['sb35', 'sb 35', 'senate bill 35', 'streamlin', 'ministerial approval'],
  sb10: ['sb10', 'sb 10', 'senate bill 10', 'transit-oriented', 'upzon'],
  builders_remedy: ["builder's remedy", 'builders remedy', 'builder remedy'],
  recent_ordinance: ['ordinance', 'ballot measure', 'measure ', 'moratorium', 'urgency'],
};

function classify(text: string): Topic {
  const lower = text.toLowerCase();
  for (const [topic, keywords] of Object.entries(TOPIC_KEYWORDS) as [Exclude<Topic, 'other'>, string[]][]) {
    if (keywords.some((k) => lower.includes(k))) return topic;
  }
  return 'other';
}

function confidenceFor(item: LinkupSourceResult): 'high' | 'medium' | 'low' {
  if (!item.url) return 'low';
  // Official .gov / municipal code sources are the highest-trust tier for this domain.
  if (/\.gov(\/|$)/.test(item.url) || item.url.includes('codepublishing') || item.url.includes('ecode360')) {
    return 'high';
  }
  return 'medium';
}

/** Splits a block of text into candidate claim sentences (~1-3 sentences, non-trivial length). */
function splitIntoClaims(text: string): string[] {
  return text
    .split(/(?<=[.!?])\s+/)
    .map((s) => s.trim())
    .filter((s) => s.length > 40 && s.length < 500);
}

// Cap claims kept per source item and total per call so one verbose page
// doesn't drown the eligibility signal in noise -- we only need enough
// on-topic claims to ground each pathway verdict, not a full transcript.
const MAX_CLAIMS_PER_ITEM = 4;
const MAX_TOTAL_FINDINGS = 60;

export function extractFindings(response: LinkupSearchResponse): ExtractedFinding[] {
  const items: LinkupSourceResult[] = response.results ?? response.sources ?? [];
  const findings: ExtractedFinding[] = [];
  const seen = new Set<string>();

  for (const item of items) {
    const text = item.content ?? item.snippet ?? '';
    if (!text) continue;
    const conf = confidenceFor(item);

    // Prefer on-topic sentences (mentions a tracked keyword) over generic ones,
    // so the cap keeps the claims most likely to matter for a verdict.
    const claims = splitIntoClaims(text);
    const scored = claims
      .map((claim) => ({ claim, topic: classify(claim) }))
      .sort((a, b) => (a.topic === 'other' ? 1 : 0) - (b.topic === 'other' ? 1 : 0))
      .slice(0, MAX_CLAIMS_PER_ITEM);

    for (const { claim, topic } of scored) {
      const key = claim.toLowerCase();
      if (seen.has(key)) continue;
      seen.add(key);
      findings.push({
        claim,
        topic,
        source_url: item.url ?? null,
        source_name: item.name ?? null,
        confidence: conf,
      });
      if (findings.length >= MAX_TOTAL_FINDINGS) return findings;
    }
  }

  // If Linkup returned a top-level sourcedAnswer-style `answer` string, capture it too.
  if (response.answer) {
    for (const claim of splitIntoClaims(response.answer)) {
      const key = claim.toLowerCase();
      if (seen.has(key)) continue;
      seen.add(key);
      findings.push({
        claim,
        topic: classify(claim),
        source_url: null,
        source_name: 'linkup:answer',
        confidence: 'medium',
      });
      if (findings.length >= MAX_TOTAL_FINDINGS) return findings;
    }
  }

  return findings;
}
