## APP-01: builders-remedy-checker-scaffold

Next.js app scaffold: Builder's Remedy / SB9-SB35 eligibility checker for San Mateo County.
Linkup Search API integration, storage layer, gap-detection follow-up-search logic.

**Priority**: critical
**Reversibility**: reversible
**Repo**: /mnt/ithicc/git/hackathons/housing
**Scope**: app/ directory — Next.js App Router + TypeScript, Linkup integration reading
  LINKUP_API_KEY from .env, storage (SQLite locally / Turso or Postgres for Vercel
  deploy — ephemeral serverless FS confirmed, see reports/deployment-plan.md), gap
  detection + follow-up search logic, results UI showing sources/search sequence/
  uncertainty flags.
**Done-when**: `npm run dev` runs; scripts/smoke-test-linkup.ts passes against the real
  Linkup API; end-to-end flow (enter jurisdiction -> cached lookup -> live search ->
  gap detect -> follow-up -> sourced verdict) verified once.
**Agent**: @ralph-coder
**Created**: 2026-09-05
**Claimed-By**: a93f33dd42b42c0e7
**Claim-Time**: 2026-09-05T12:47:00Z
**Commit**: (uncommitted — see OPS-01)
**Review**: PASS — live end-to-end verification against real Linkup API (Redwood City,
  Menlo Park): cache-check -> live search -> gap-detection -> real follow-up search ->
  sourced verdict, with honest "could not confirm" section. `npm run build` clean.
  Storage uses better-sqlite3 locally / Turso in production (Vercel ephemeral-FS fix
  already applied). Needs @pm validation to close to done/.

