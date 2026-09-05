# Builder's Remedy Checker

SB9 / SB35 / SB10 / Builder's Remedy eligibility checker for San Mateo County, CA.
Next.js (App Router) + TypeScript + Tailwind, backed by a Linkup-Search-powered
research pipeline with real gap detection and follow-up search.

## Durable spec (read this first)

The pipeline's shape (input → stored-cache-check → linkup-search → gap-detection →
follow-up-search → eligibility-verdict → sourced-output) is authored as a chronology
citizen per this project's Chronology-First Development discipline:

**`HOF/2026/09/05/20/af-builders-remedy-checker-pipeline.af.scm`**

That file is the source of truth for what the pipeline does and why; this README is a
pointer to it, not a duplicate. It was verified to load and evaluate in the HOF
interpreter (`hof repl`, `:load <path>`) before this README was written.

## What's implemented

- `src/lib/cities.ts` — the county's jurisdictions (14 incorporated cities + the
  unincorporated county), matching `HOF/sources/<slug>/`.
- `src/lib/hofCache.ts` — reads this project's own pre-existing per-city research
  (`HOF/sources/<city>/**/*.{md,scm}`) as a starting cache, so live Linkup calls only
  fill genuine gaps.
- `src/lib/linkup.ts` + `src/lib/queries.ts` — Linkup Search API client and query
  builders, following the depth/outputType/date-filter rules in
  `.claude/skills/linkup-search` and `.claude/skills/linkup-workflow`.
- `src/lib/extractFindings.ts` — turns a Linkup response into topic-tagged, deduped,
  capped, sourced findings.
- `src/lib/gaps.ts` (`findGaps`) — real inspection logic that decides whether 0, 1, or
  2 follow-up searches are needed, based on missing/ambiguous topic coverage or a
  named-but-undetailed ordinance/ballot measure. Not a hardcoded second call.
- `src/lib/eligibility.ts` — scores accumulated findings into a per-pathway verdict
  (`likely_applies` / `possibly_applies` / `likely_does_not_apply` / `unknown`), always
  citing its basis claims and source URLs.
- `src/lib/pipeline.ts` (`runEligibilityPipeline`) — orchestrates all of the above and
  persists every search + finding.
- `src/lib/db.ts` — storage layer. **Local dev**: a `better-sqlite3` file at
  `app/data/*.sqlite` (gitignored). **Production**: Vercel's serverless filesystem is
  ephemeral/read-only at runtime, so if `TURSO_DATABASE_URL` is set the same schema is
  written to Turso (libSQL) instead — set that (and `TURSO_AUTH_TOKEN`) before
  deploying to Vercel, or point at Postgres if you'd rather not use Turso.
- UI: `/` (address/jurisdiction picker) → `POST /api/search` (runs the full pipeline)
  → `/results/[sessionId]` (verdict grid, full search sequence with each follow-up's
  trigger reason, starting-cache file list, every external source URL, and an explicit
  "Could not confirm" section for anything left `unknown`).

## Linkup API key

Live-verified against the real Linkup Search API on 2026-09-05 (see the citizen file
above for the specific verification notes). To run it yourself:

```bash
cp .env.example .env.local
# edit .env.local and set LINKUP_API_KEY=...
npm install
npm run smoke:linkup   # one live search call, prints raw response
npm run dev            # full app at http://localhost:3000 (or next free port)
```

If `LINKUP_API_KEY` is missing, both the smoke test and the app fail with a clear
`LinkupConfigError` message rather than fabricating results.

## Other scripts

- `npm run seed:cities` — walks `HOF/sources/` for all jurisdictions and reports,
  per city, which required topics (Housing Element compliance, SB9, SB35, SB10,
  Builder's Remedy) are already covered by cached research vs. still a gap for a live
  Linkup pass. Does not call Linkup; pure cache introspection.

## Known limitations / next steps

- Address → jurisdiction matching is a simple substring match on city name, not a
  geocoder — ambiguous/misspelled addresses fall back to the manual city picker.
- `extractFindings` is heuristic (keyword classification + sentence splitting), not an
  LLM pass; it's deliberately cheap and inspectable rather than maximally precise.
- The eligibility verdict is a plausibility read for a non-specialist user, not legal
  advice — every card shows its basis and confidence, and unresolved pathways are
  labeled "Could not confirm" rather than guessed.
