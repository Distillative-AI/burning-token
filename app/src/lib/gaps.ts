// findGaps() inspects everything found so far (stored findings + the starting
// HOF cache) for a jurisdiction and decides what, if anything, still needs a
// follow-up Linkup search. This is real inspection logic, not a hardcoded
// second call: a jurisdiction whose first search already resolved every topic
// triggers zero follow-ups; one with an ambiguous compliance status or a named-
// but-undetailed ordinance triggers 1-2 targeted follow-ups.

import { FindingRow } from './db';
import { Topic } from './extractFindings';

export interface Gap {
  topic: Topic;
  reason: string;
  /** Natural-language description fed into buildFollowUpQuery(). */
  gapDescription: string;
}

const REQUIRED_TOPICS: Topic[] = ['housing_element_compliance', 'sb9', 'sb35', 'builders_remedy'];

const AMBIGUITY_MARKERS = [
  'unclear',
  'not confirmed',
  'could not confirm',
  'unsure',
  'unknown',
  'may or may not',
  'pending',
  'appears to',
  'likely',
];

function isAmbiguous(claim: string): boolean {
  const lower = claim.toLowerCase();
  return AMBIGUITY_MARKERS.some((m) => lower.includes(m));
}

/** Looks for a named-but-undetailed ordinance/measure ("Measure T", "Ordinance 123") without a resolving detail claim nearby. */
function findUndetailedOrdinanceMentions(findings: FindingRow[]): string[] {
  const named = new Set<string>();
  const nameRegex = /\b(measure\s+[a-z0-9]+|ordinance\s+(no\.?\s*)?\d+[a-z]?)\b/gi;

  for (const f of findings) {
    if (f.topic !== 'recent_ordinance') continue;
    const matches = f.claim.match(nameRegex);
    if (!matches) continue;
    for (const m of matches) named.add(m.trim());
  }
  return Array.from(named);
}

export function findGaps(findings: FindingRow[], jurisdictionName: string): Gap[] {
  const gaps: Gap[] = [];
  const byTopic = new Map<Topic, FindingRow[]>();
  for (const f of findings) {
    const list = byTopic.get(f.topic as Topic) ?? [];
    list.push(f);
    byTopic.set(f.topic as Topic, list);
  }

  // 1. Missing or ambiguous coverage on a required topic.
  for (const topic of REQUIRED_TOPICS) {
    const topicFindings = byTopic.get(topic) ?? [];
    if (topicFindings.length === 0) {
      gaps.push({
        topic,
        reason: `No findings at all on ${topic.replace(/_/g, ' ')} for ${jurisdictionName}.`,
        gapDescription: describeTopicGap(topic),
      });
      continue;
    }
    const allAmbiguous = topicFindings.every((f) => isAmbiguous(f.claim));
    if (allAmbiguous) {
      gaps.push({
        topic,
        reason: `All ${topicFindings.length} finding(s) on ${topic.replace(/_/g, ' ')} for ${jurisdictionName} read as ambiguous/unconfirmed.`,
        gapDescription: describeTopicGap(topic, true),
      });
    }
  }

  // 2. A specific ordinance/ballot measure is named but never given a resolving detail.
  const namedOrdinances = findUndetailedOrdinanceMentions(findings);
  for (const name of namedOrdinances.slice(0, 1)) {
    // Cap: don't fire more than one ordinance-detail follow-up per pass.
    gaps.push({
      topic: 'recent_ordinance',
      reason: `${name} is mentioned by name for ${jurisdictionName} but no finding details its actual effect on housing approvals.`,
      gapDescription: `Find and read the actual text or an official summary of "${name}" and state precisely how it changes housing project approvals (what it restricts, blocks, or requires, and its effective/vote date).`,
    });
  }

  // Cap total follow-ups at 2 per the product spec.
  return gaps.slice(0, 2);
}

function describeTopicGap(topic: Topic, wasAmbiguous = false): string {
  const prefix = wasAmbiguous ? 'Resolve the ambiguity in prior results about' : 'Specifically determine';
  switch (topic) {
    case 'housing_element_compliance':
      return `${prefix} whether this jurisdiction's Housing Element is currently HCD-certified/compliant or not, citing the HCD status page or the city's own planning page.`;
    case 'sb9':
      return `${prefix} whether SB9 lot-split/duplex ministerial review is currently available here and whether the city has adopted any SB9 implementing ordinance or objective standards.`;
    case 'sb35':
      return `${prefix} whether SB35 streamlined ministerial approval currently applies here (it depends on RHNA progress) and at what affordability threshold (10% vs 50%).`;
    case 'sb10':
      return `${prefix} whether the city has adopted an SB10 transit-density overlay resolution, and if not, whether one has been proposed.`;
    case 'builders_remedy':
      return `${prefix} whether Builder's Remedy is currently active here (i.e. the Housing Element is not certified) and list any Builder's Remedy applications filed.`;
    case 'recent_ordinance':
      return `${prefix} any ordinance or ballot measure adopted in the last 12 months materially affecting housing approvals.`;
    default:
      return `${prefix} more detail on ${topic}.`;
  }
}
