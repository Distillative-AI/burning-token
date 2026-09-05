## OPS-02: deploy app to Vercel

Deploy the Builder's Remedy Checker so a stranger (judge) can use it via a URL, per
the "shipping" judging criterion.

**Priority**: critical
**Reversibility**: irreversible-edge
**Repo**: /mnt/ithicc/git/hackathons/housing
**Scope**: `vercel login` (interactive, human step), `vercel link`, set
  LINKUP_API_KEY env var in Vercel project settings, `vercel deploy --prod`. See
  reports/deployment-plan.md for the full plan (Turso/Postgres needed if the app
  persists data — SQLite serverless FS is ephemeral).
**Done-when**: a public URL loads the app and completes one real eligibility check
  end to end.
**Agent**: human-required for login step, then @ralph-coder for the rest
**Created**: 2026-09-05
**Depends**: APP-01-builders-remedy-checker-scaffold
**Blocker**: human-requirement — `vercel login` needs interactive browser auth from
  the founder; cannot be done by an agent.
