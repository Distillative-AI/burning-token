// Derives a plausible eligibility verdict per housing-law pathway from the
// accumulated findings. This is explicitly a "plausibility" read for a
// non-lawyer user, not a legal determination -- every verdict line carries a
// confidence level and cites the findings it came from, and anything not
// resolved goes into "Could not confirm" rather than being guessed.

import { FindingRow } from './db';
import { Topic } from './extractFindings';

export type PathwayStatus = 'likely_applies' | 'possibly_applies' | 'likely_does_not_apply' | 'unknown';

export interface PathwayVerdict {
  pathway: 'SB9' | 'SB35' | 'SB10' | "Builder's Remedy";
  topic: Topic;
  status: PathwayStatus;
  basis: string[]; // finding claims that informed this verdict
  sourceUrls: string[];
}

const POSITIVE_MARKERS = ['applies', 'available', 'adopted', 'certified', 'compliant', 'eligible', 'active'];
const NEGATIVE_MARKERS = ['does not apply', 'not available', 'not adopted', 'non-compliant', 'ineligible', 'no jurisdiction'];

function scoreClaims(claims: FindingRow[]): PathwayStatus {
  if (claims.length === 0) return 'unknown';
  let pos = 0;
  let neg = 0;
  for (const c of claims) {
    const lower = c.claim.toLowerCase();
    if (NEGATIVE_MARKERS.some((m) => lower.includes(m))) neg++;
    else if (POSITIVE_MARKERS.some((m) => lower.includes(m))) pos++;
  }
  if (pos > 0 && neg === 0) return 'likely_applies';
  if (neg > 0 && pos === 0) return 'likely_does_not_apply';
  if (pos > 0 && neg > 0) return 'possibly_applies';
  return 'unknown';
}

function buildVerdict(
  pathway: PathwayVerdict['pathway'],
  topic: Topic,
  findings: FindingRow[]
): PathwayVerdict {
  const relevant = findings.filter((f) => f.topic === topic);
  return {
    pathway,
    topic,
    status: scoreClaims(relevant),
    basis: relevant.map((f) => f.claim),
    sourceUrls: Array.from(new Set(relevant.map((f) => f.source_url).filter((u): u is string => !!u))),
  };
}

export function buildEligibilitySummary(findings: FindingRow[]): PathwayVerdict[] {
  return [
    buildVerdict('SB9', 'sb9', findings),
    buildVerdict('SB35', 'sb35', findings),
    buildVerdict('SB10', 'sb10', findings),
    buildVerdict("Builder's Remedy", 'builders_remedy', findings),
  ];
}

export function unresolvedTopics(verdicts: PathwayVerdict[]): PathwayVerdict[] {
  return verdicts.filter((v) => v.status === 'unknown');
}
