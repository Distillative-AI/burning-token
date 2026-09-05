// Query construction for this app's Linkup calls, following
// .claude/skills/linkup-search + linkup-workflow rules:
//   - depth=standard when facts should be resolvable across a few snippets in
//     parallel (compliance status, which SB applies).
//   - depth=deep only when the plan is genuinely sequential (find the specific
//     ordinance/ballot measure page, then read/scrape it for detail).
//   - each query is a retrieval plan: target entity, fields to return, and an
//     explicit "cite source URLs" instruction.

import { LinkupDepth, LinkupSearchRequest, twelveMonthsAgoISODate } from './linkup';

export function buildInitialQuery(cityName: string): LinkupSearchRequest {
  return {
    depth: 'standard',
    outputType: 'searchResults',
    q:
      `Find the CURRENT Housing Element compliance status (certified/compliant or non-compliant with HCD) for ` +
      `${cityName}, San Mateo County, California; whether SB9, SB35, SB10, and Builder's Remedy plausibly apply ` +
      `there today given that status and any local zoning overlays adopted for them; and any ordinance or ballot ` +
      `measure changes affecting housing approvals in ${cityName} in the last 12 months. Return each fact with its ` +
      `source URL and publication date. Say explicitly if something cannot be confirmed.`,
    fromDate: twelveMonthsAgoISODate(),
  };
}

export function buildFollowUpQuery(
  cityName: string,
  gapDescription: string,
  depth: LinkupDepth = 'deep'
): LinkupSearchRequest {
  return {
    depth,
    outputType: 'searchResults',
    q:
      `For ${cityName}, San Mateo County, California: ${gapDescription} ` +
      `Find the official city/county page or news source, and if the fact requires reading a full ordinance or ` +
      `ballot measure page, scrape it for the specific detail requested. Return the exact fact, its source URL, ` +
      `and publication/effective date. Say explicitly if it cannot be confirmed.`,
  };
}
