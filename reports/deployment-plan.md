# Deployment Plan — Builder's Remedy Checker (Next.js + SQLite) to Vercel

Goal: get the app live at a public URL a stranger can use TODAY, with minimal ceremony.

## (a) Does Vercel free tier cover this app?

Yes, for a small hackathon-scale Next.js app. Vercel Hobby (free) plan limits, 2026:

- 100 GB bandwidth / month
- 100 hours serverless function execution / month
- 100K serverless function invocations / month
- Max 10 seconds execution time per function
- 1 concurrent build
- Personal / non-commercial use, single developer

For a demo tool getting hackathon-scale traffic (dozens to low hundreds of requests),
this is comfortably within limits. The Hobby plan's "non-commercial" restriction is
fine for a hackathon submission; revisit if this becomes a paid/commercial product
later (upgrade to Pro at $20/seat/month).

## (b) SQLite-on-Vercel gotcha — CONFIRMED, ACTION NEEDED

**Vercel serverless functions have an ephemeral, ofen-read-only filesystem.** Any
SQLite file written at runtime (e.g. `better-sqlite3` writing to `/tmp` or to the
deployed bundle path) will:
- Not persist across invocations (each invocation may hit a cold, fresh container)
- Not be shared across concurrent function instances (no shared disk)
- In many configurations, live in a read-only part of the filesystem for the bundled
  app directory itself

**This works fine ONLY if:**
- The SQLite DB is a **read-only, pre-seeded, bundled file** (e.g. eligibility rules,
  zoning data) shipped at build/deploy time and never written to at runtime. Read-only
  queries against a bundled `.db` file are a supported, common pattern.
- There is **no user-generated persistent state** that needs to survive between
  requests (e.g. saved searches, submitted addresses, user accounts).

**If the app needs to WRITE and persist data (user submissions, saved results, any
mutable state), SQLite-on-Vercel will silently lose data. Fix options, in order of
least friction for a hackathon:**

1. **Turso** (recommended for "still feels like SQLite") — libSQL-based serverless
   SQLite with a generous free tier, drop-in-ish replacement for `better-sqlite3`/
   `sqlite3` clients via `@libsql/client`. Vercel has a native Turso Cloud marketplace
   integration. Minimal code change if the app already uses a thin DB access layer.
2. **Vercel Postgres / Neon** (Vercel's own recommended default for 2026) — serverless
   Postgres, free tier, first-party Vercel integration (`vercel storage` or Neon
   marketplace listing). Slightly more schema/query rewrite if the app is
   SQL-dialect-specific, but well-trodden path and zero extra signup friction if using
   the Vercel-integrated Neon listing.
3. If truly read-only static reference data only — **skip both** and just bundle the
   `.db` file read-only; no migration needed.

**Recommendation for this hackathon:** confirm with the other agent building `app/`
whether the SQLite usage is read-only (rules/zoning data) or has writes (e.g. saved
eligibility checks). If read-only, ship as-is. If writes are needed, switch to Turso
before deploying — it's the smallest diff from existing SQLite client code.

## (c) Exact CLI steps (no GitHub repo required)

Vercel CLI supports 100% local, repo-less deployment.

```bash
# 1. One-time login (opens browser for auth — REQUIRES USER'S INTERACTIVE LOGIN,
#    not run by this agent)
npx vercel login

# 2. From the app/ directory, link the local folder to a new Vercel project
cd app/
npx vercel link
#   - "Set up and deploy?" -> Yes
#   - "Link to existing project?" -> No (first time)
#   - Enter a project name (e.g. builders-remedy-checker)
#   - Confirm the directory containing the Next.js app

# 3. Deploy a preview first (sanity check)
npx vercel deploy

# 4. Promote to production URL
npx vercel deploy --prod
# NOTE: the FIRST deployment of a new project is already a production deployment
# even without --prod; --prod matters for subsequent redeploys.

# Optional: pull env vars (e.g. LINKUP_API_KEY) set in the Vercel dashboard down
# to local .env.local for local dev parity
npx vercel env pull .env.local
```

Env vars needed on Vercel (set via `vercel env add` or the dashboard) before prod
deploy works end-to-end:
- `LINKUP_API_KEY` (see `linkup-pricing-notes.md` for API shape)
- Any Turso/Postgres connection string, if the SQLite-write fix above is applied

## (d) Local environment check (this machine, 2026-09-05)

- `which vercel` → **not found** (no global binary installed)
- `npx vercel --version` → works, resolves and runs **Vercel CLI 59.11.7** via npx
  (no install needed; `npx vercel <cmd>` is the right invocation throughout this plan)
  - Node engine warning: local Node is v18.19.1; several vercel CLI transitive deps
    request Node >=20. It still ran and reported a version successfully, but if any
    `vercel` subcommand misbehaves, upgrading Node to 20+ is the first thing to try.
- `vercel whoami` → **hung waiting for interactive auth** — confirms **not logged in**.
  This is expected and is the one step that needs the user's one-time interactive
  login (`npx vercel login`, opens a browser). Not run here per task boundary.

## Summary / next action for the user

1. User runs `npx vercel login` once (interactive, browser-based) — the only blocking
   step this agent cannot do.
2. Confirm with the `app/`-owning agent whether SQLite usage is read-only or needs
   writes; if writes, swap in Turso before first deploy.
3. From `app/`: `npx vercel link` → `npx vercel deploy` (preview) → `npx vercel deploy --prod`.
4. Set `LINKUP_API_KEY` (and DB connection string if applicable) as Vercel env vars
   before the prod deploy is fully functional.
