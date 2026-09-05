---
description: Ingest real, sourced housing-agenda/ordinance data for a city into a Housing Tracker chronology, or launch the Housing Tracker UI against an already-cloned one.
argument-hint: [city name] | serve | ingest <city>
---

You have the `housing-tracker` Agent Skill loaded (or load it now if it isn't:
`skills/housing-tracker/SKILL.md` in this plugin) — it is the actual ingestion
methodology, not just a description of one. Follow it, don't paraphrase it.

Parse `$ARGUMENTS`:

**No arguments, or a bare city/jurisdiction name** — run the ingestion skill for that
jurisdiction:
1. If the user is working inside a clone of `github.com/Distillative-AI/burning-token`
   (check for a `HOF/` directory and `tools/hof-builds-server.mjs` at the repo root),
   ingest directly into that chronology.
2. Otherwise, ask the user whether to (a) clone that repo to work against its existing
   21-jurisdiction San Mateo County chronology, or (b) start a fresh chronology in the
   current project for a different city/county — the skill's schema and verification
   discipline apply either way.
3. Ask for (or search for) the jurisdiction's actual agenda-portal URLs if not already
   known — don't assume a vendor/URL pattern without confirming it live; portal vendors
   change (this project caught two cities that had silently migrated platforms since a
   reference spreadsheet was made).
4. Run the skill's step-by-step process. Report back exactly what was created and how
   each source was verified, and be explicit about anything searched for but not found.

**`serve`** — launch the Housing Tracker UI:
1. Locate a local clone of `github.com/Distillative-AI/burning-token` (or clone it fresh
   with `git clone --depth 1 https://github.com/Distillative-AI/burning-token.git` into a
   cache directory if none exists — it's the canonical, continuously-growing chronology).
2. Run `node tools/hof-builds-server.mjs [port]` from that clone's root (default port
   4173) and tell the user the URL. Mention this is a plain Node process with no auth —
   fine for local/demo use, not for exposing on a shared network as-is.

**`ingest <city>`** — same as the bare-city-name case above, explicit form.

Never fabricate a record to make a city's coverage look more complete than it is — an
honest "nothing verifiable found" is a correct outcome the skill explicitly expects and
reports, not a failure to paper over.
