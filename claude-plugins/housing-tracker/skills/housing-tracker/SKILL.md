---
name: housing-tracker
description: Ingest real, sourced, verified housing planning-commission agenda items and adopted ordinances for a city into a HOF chronology, following a strict schema and an anti-fabrication verification discipline. Use when the user asks to add a new city/jurisdiction to the Housing Tracker project, research a city's recent housing agenda activity, or backfill missing ordinance/agenda records. Portable beyond Claude Code — any Agent Skills-compatible implementer can follow this spec to reproduce or extend the ingestion pipeline.
---

# Housing Tracker — Ingestion Skill

This is the actual methodology used to build the [burning-token](https://github.com/Distillative-AI/burning-token)
Housing Tracker's data: real planning-commission agenda items and adopted ordinances for
San Mateo County, CA, each one individually verified before being written down. It was
run as a 15-agent parallel fanout to go from 6 to 21 covered jurisdictions in one pass —
this skill generalizes that exact prompt so it's repeatable for a new city, a new county,
or a different domain entirely.

## The data model (do not invent a new one)

Two schemas, defined as Scheme s-expression "citizens" in the target HOF chronology:

```scheme
;; HOF/2026/09/05/12/af-city-agenda-item.af.scm
(af:city-agenda-item city body meeting-date agenda-item source-url)
;;   city         : string  — city slug, e.g. "san-mateo"
;;   body         : symbol  — 'planning-commission | 'city-council | ...
;;   meeting-date : string  — ISO 8601 "YYYY-MM-DD"
;;   agenda-item  : string  — the item's text, as specific as the source allows
;;   source-url   : string  — the DIRECT document URL (see verification rules below)

;; HOF/2026/09/05/12/af-adopted-ordinance.af.scm
(af:adopted-ordinance city ordinance-number title adopted-date effective-date source-url)
;;   ordinance-number, adopted-date, effective-date : string OR #f if genuinely unknown
```

Each real instance lives in its own file (`af-agenda-pc-<date>-<slug>.af.scm` or
`af-ord-<slug>.af.scm`), one `(define ...)` per file, with a header comment block giving
provenance (see `references/citizen-file-template.md` for the exact format and a worked
example).

## The verification discipline (this is the load-bearing part)

Three rules, none of them optional:

1. **The `source-url` must be a direct document, not a portal page.** A calendar list,
   a meeting-index page, or a bare "AgendaCenter" search page is not acceptable — resolve
   through to the actual PDF (or, for JS-rendered agenda-viewer platforms with no
   bare-fetchable PDF, the most specific meeting-detail URL available, with that caveat
   stated honestly in the file's Source comment).
2. **Every `source-url` must be independently verified before it's written down** — fetch
   it and check the HTTP status and content-type:
   ```bash
   curl -s -o /dev/null -w "%{http_code} %{content_type}\n" "<url>"
   ```
   Then extract the document's actual text (`pypdf`, `pdftotext`, or a manual zlib-inflate
   of the PDF content streams if no PDF tool is available) and confirm it contains the
   specific facts the citizen file claims — a date, a project name, an ordinance number.
   A search-engine snippet is a *lead*, never a substitute for this step.
3. **No fabrication, ever.** If a genuine research effort turns up nothing verifiable —
   no adopted ordinance, no substantive housing item, an unconfirmed ordinance number —
   that is a valid, reportable outcome. Write nothing rather than guess. Every "not found"
   in this project's history is itself informative (it means the structural moat researched
   elsewhere in the chronology has no counter-example yet, not that no one looked).

## Research tooling

Prefer the **Linkup Search API** for discovery, since this is usually a sequential
"find the portal → then open the specific document" task:

```bash
curl -sS -X POST "https://api.linkup.so/v1/search" \
  -H "Authorization: Bearer $LINKUP_API_KEY" -H "Content-Type: application/json" \
  -d '{"q":"<retrieval plan, not a question>","depth":"deep","outputType":"searchResults"}'
```

Read the key from the environment/`.env` at runtime — never hardcode or echo it. Fall back
to a browser tool or direct portal navigation when a site blocks Linkup's fetcher, sits
behind a sign-in wall, or when you already have a confirmed URL and just need to walk its
sibling pages (this happened in practice: CivicPlus AgendaCenter sign-in walls, Portola
Valley's edge-blocked `curl`/WebFetch). Whichever tool finds the candidate, the direct-fetch
verification in step 2 above is still mandatory before writing anything down.

## Step-by-step for one new jurisdiction

1. Read the two schema files and one real example instance (see `references/`) to match
   the exact header/`@gherkin`/call-signature conventions.
2. Read any prior research already collected for this jurisdiction (a `SOURCES.md` /
   `eligibility-snapshot.md` under a `sources/<city>/` directory, if this chronology has one)
   — build on it, don't duplicate it.
3. Confirm the jurisdiction's actual current agenda-portal vendor and Planning Commission
   URL by fetching it live — source-of-truth spreadsheets go stale (this project caught
   Brisbane and Daly City having silently migrated platforms since a reference CSV was made).
4. Find the 1-3 most recent meetings with a real, substantive housing-relevant item —
   new dwelling units, ADU, SB9 lot split, density bonus, a Housing-Element-implementing
   zoning amendment — and any recently adopted ordinance (SB9/ADU/zoning text amendment/
   ballot measure).
5. Resolve and verify each `source-url` per the discipline above.
6. Author the citizen file(s), one `(define ...)` per file, in the target chronology
   location (e.g. an hour-bucketed date folder — see `references/citizen-file-template.md`).
7. Report back: what was created, how each source was verified, and what was searched
   for but not found (and why) — never silently omit a null result.

## Classifying what you find (optional, for consumers of this data)

If the ingested item is meant to feed a UI (like this project's), two lightweight,
regex-based classifiers ride on top of the raw text — see `references/classification-heuristics.md`
for the exact patterns this project uses to flag housing-signal (residential vs.
commercial/other) and the seven-mechanism capture taxonomy (CEQA litigation, ballot-box
supermajority, discretionary design review, subjective design standards, PLA-linked
appeals, minimum-lot-size/setback/height caps, fiscal zoning). Both are heuristics, not
ground truth — tune false positives/negatives against real text rather than trusting a
single keyword match (this project shipped and then had to fix a real bug where an R&D
building's own "this is NOT a housing project" disclaimer still tripped the housing-signal
regex because it contains the word "housing").

## Reusing this outside San Mateo County / outside Claude Code

Nothing here is county-specific except the two schema field names (which are generic:
city, meeting body, date, item text, source). To point this at a different county or a
different domain (e.g. a different state's equivalent public-meeting transparency law),
swap the schema's `city`/jurisdiction field for whatever your domain's unit is, keep the
same three verification rules, and keep the same "write nothing rather than guess" bar —
that discipline, not the file format, is the actual reusable part.
