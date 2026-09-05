# Eligibility Pathway Model — thin pointer

Per /cfd: this file is a pointer, not the source of truth. The source of truth is the HOF
chronology below. Do not duplicate content here — read the citizens directly.

## Chronology paths (load in this order in `hof repl`)

```
HOF/2026/09/05/05/af-eligibility-pathway-type.af.scm
HOF/2026/09/05/05/af-eligibility-pathway-status.af.scm
HOF/2026/09/05/05/af-jurisdiction-pathway-instance.af.scm
HOF/2026/09/05/05/hof-jurisdiction-pathway-index.hof.scm
HOF/2026/09/05/05/hof-pathway-eligibility-lookup.hof.scm
```

## What it is

The queryable model distilled from the 21 `HOF/sources/<city-slug>/eligibility-snapshot.md`
prose documents — one `af:jurisdiction-pathway-instance` record per (jurisdiction, pathway)
pair, 84 records total (21 jurisdictions x 4 pathways: SB9 lot split, SB35 streamlined
ministerial, SB10 transit density, Builder's Remedy). This is the intended eventual
queryable replacement for the prose-hedge-scoring logic in `app/src/lib/eligibility.ts`
(`buildEligibilitySummary`) — wiring the app to actually call this model is a separate,
future task, out of scope here.

## How to call it

```
:load HOF/2026/09/05/05/af-eligibility-pathway-type.af.scm
:load HOF/2026/09/05/05/af-eligibility-pathway-status.af.scm
:load HOF/2026/09/05/05/af-jurisdiction-pathway-instance.af.scm
:load HOF/2026/09/05/05/hof-jurisdiction-pathway-index.hof.scm
:load HOF/2026/09/05/05/hof-pathway-eligibility-lookup.hof.scm
(hof:pathway-eligibility-lookup "san-carlos")
```

Returns a list of up to 4 alists (one per pathway) with keys `jurisdiction`, `pathway-type`,
`status`, `restrictions`, `source-urls`, `as-of-date`, `confidence`. An unknown jurisdiction
slug returns `'()`, never an error and never a fabricated record.

## Confidence discipline

Every record's `confidence` field mirrors its source snapshot's own hedge language —
anything the snapshot itself calls "UNCONFIRMED" or an absence-of-evidence inference carries
confidence below 0.5. See the header comment of `hof-jurisdiction-pathway-index.hof.scm` for
the full extraction methodology and interpreter-verification notes.
