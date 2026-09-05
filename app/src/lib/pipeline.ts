// Orchestrates the full pipeline described in HOF/2026/09/05/<hour>/
// af-builders-remedy-checker-pipeline.af.scm:
//   input -> stored-cache-check -> linkup-search -> gap-detection ->
//   follow-up-search -> eligibility-verdict -> sourced-output

import { randomUUID } from 'node:crypto';
import { City } from './cities';
import { loadCityCache, cacheSourceList, CachedDoc } from './hofCache';
import { linkupSearch, LinkupApiError, LinkupConfigError } from './linkup';
import { buildInitialQuery, buildFollowUpQuery } from './queries';
import { extractFindings } from './extractFindings';
import { findGaps, Gap } from './gaps';
import { buildEligibilitySummary, unresolvedTopics } from './eligibility';
import { insertSearch, updateSearchResult, insertFinding, getFindingsBySession, getSearchesBySession, FindingRow } from './db';

export interface PipelineStepLog {
  searchId: number;
  query: string;
  depth: string;
  triggerReason: string;
  status: 'ok' | 'error';
  error?: string;
  findingsCount: number;
}

export interface PipelineResult {
  sessionId: string;
  jurisdiction: City;
  cacheDocs: { path: string }[];
  steps: PipelineStepLog[];
  findings: FindingRow[];
  eligibility: ReturnType<typeof buildEligibilitySummary>;
  couldNotConfirm: ReturnType<typeof unresolvedTopics>;
  configError?: string;
}

async function runOneSearch(
  sessionId: string,
  jurisdiction: City,
  query: ReturnType<typeof buildInitialQuery>,
  triggerReason: string
): Promise<PipelineStepLog> {
  const searchId = await insertSearch({
    session_id: sessionId,
    jurisdiction: jurisdiction.slug,
    query: query.q,
    depth: query.depth,
    output_type: query.outputType,
    trigger_reason: triggerReason,
    timestamp: new Date().toISOString(),
    raw_json: null,
    status: 'pending',
    error: null,
  });

  try {
    const response = await linkupSearch(query);
    await updateSearchResult(searchId, JSON.stringify(response), 'ok');

    const extracted = extractFindings(response);
    for (const f of extracted) {
      await insertFinding({
        search_id: searchId,
        jurisdiction: jurisdiction.slug,
        claim: f.claim,
        topic: f.topic,
        source_url: f.source_url,
        source_name: f.source_name,
        confidence: f.confidence,
        origin: 'linkup',
      });
    }

    return {
      searchId,
      query: query.q,
      depth: query.depth,
      triggerReason,
      status: 'ok',
      findingsCount: extracted.length,
    };
  } catch (err) {
    const message = err instanceof Error ? err.message : String(err);
    await updateSearchResult(searchId, '', 'error', message);
    return {
      searchId,
      query: query.q,
      depth: query.depth,
      triggerReason,
      status: 'error',
      error: message,
      findingsCount: 0,
    };
  }
}

/** Seeds findings rows straight from the HOF cache docs, tagged origin='cache', with no Linkup call. */
async function seedFindingsFromCache(sessionId: string, jurisdiction: City, cacheDocs: CachedDoc[]): Promise<number> {
  if (cacheDocs.length === 0) return 0;
  const searchId = await insertSearch({
    session_id: sessionId,
    jurisdiction: jurisdiction.slug,
    query: `[cache] pre-existing HOF/sources/${jurisdiction.slug}/ research`,
    depth: 'cache',
    output_type: 'cache',
    trigger_reason: 'stored-cache-check',
    timestamp: new Date().toISOString(),
    raw_json: JSON.stringify(cacheDocs.map((d) => d.relativePath)),
    status: 'ok',
    error: null,
  });

  let count = 0;
  for (const doc of cacheDocs) {
    // Cache docs are markdown/scm research notes, not raw Linkup snippets --
    // store one finding per doc pointing back at the file, so gap detection
    // can see "we have SOMETHING on this city" without over-parsing prose.
    const topicGuess = /housing element|hcd|compliant/i.test(doc.content)
      ? 'housing_element_compliance'
      : /builder'?s remedy/i.test(doc.content)
      ? 'builders_remedy'
      : /sb\s*9|sb9/i.test(doc.content)
      ? 'sb9'
      : /sb\s*35|sb35/i.test(doc.content)
      ? 'sb35'
      : /sb\s*10|sb10/i.test(doc.content)
      ? 'sb10'
      : /ordinance|ballot measure/i.test(doc.content)
      ? 'recent_ordinance'
      : 'other';

    await insertFinding({
      search_id: searchId,
      jurisdiction: jurisdiction.slug,
      claim: `Pre-existing project research on file: ${doc.relativePath} (see file for detail).`,
      topic: topicGuess,
      source_url: null,
      source_name: doc.relativePath,
      confidence: 'medium',
      origin: 'cache',
    });
    count++;
  }
  return count;
}

export async function runEligibilityPipeline(jurisdiction: City): Promise<PipelineResult> {
  const sessionId = randomUUID();

  // 1. stored-cache-check
  const cacheDocs = loadCityCache(jurisdiction.slug);
  await seedFindingsFromCache(sessionId, jurisdiction, cacheDocs);

  const steps: PipelineStepLog[] = [];
  let configError: string | undefined;

  try {
    // 2. linkup-search (initial)
    const initialQuery = buildInitialQuery(jurisdiction.name);
    steps.push(await runOneSearch(sessionId, jurisdiction, initialQuery, 'initial'));

    // 3. gap-detection + 4. follow-up-search (0-2 rounds per spec)
    const findings = await getFindingsBySession(sessionId);
    const gaps: Gap[] = findGaps(findings, jurisdiction.name);

    for (const gap of gaps) {
      const followUp = buildFollowUpQuery(jurisdiction.name, gap.gapDescription);
      steps.push(
        await runOneSearch(sessionId, jurisdiction, followUp, `follow-up: ${gap.reason}`)
      );
    }
  } catch (err) {
    if (err instanceof LinkupConfigError) {
      configError = err.message;
    } else if (err instanceof LinkupApiError) {
      configError = err.message;
    } else {
      throw err;
    }
  }

  // 5. eligibility-verdict + 6. sourced-output
  const findings = await getFindingsBySession(sessionId);
  const eligibility = buildEligibilitySummary(findings);
  const couldNotConfirm = unresolvedTopics(eligibility);

  return {
    sessionId,
    jurisdiction,
    cacheDocs: cacheSourceList(cacheDocs),
    steps,
    findings,
    eligibility,
    couldNotConfirm,
    configError,
  };
}

export async function loadPipelineResultFromSession(sessionId: string, jurisdiction: City): Promise<PipelineResult> {
  const searches = await getSearchesBySession(sessionId);
  const findings = await getFindingsBySession(sessionId);
  const eligibility = buildEligibilitySummary(findings);
  const couldNotConfirm = unresolvedTopics(eligibility);

  const steps: PipelineStepLog[] = searches
    .filter((s) => s.trigger_reason !== 'stored-cache-check')
    .map((s) => ({
      searchId: s.id,
      query: s.query,
      depth: s.depth,
      triggerReason: s.trigger_reason,
      status: s.status === 'ok' ? 'ok' : 'error',
      error: s.error ?? undefined,
      findingsCount: findings.filter((f) => f.search_id === s.id).length,
    }));

  const cacheSearch = searches.find((s) => s.trigger_reason === 'stored-cache-check');
  const cacheDocs: { path: string }[] = cacheSearch?.raw_json
    ? (JSON.parse(cacheSearch.raw_json) as string[]).map((p) => ({ path: p }))
    : [];

  return {
    sessionId,
    jurisdiction,
    cacheDocs,
    steps,
    findings,
    eligibility,
    couldNotConfirm,
  };
}
