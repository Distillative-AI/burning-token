# housing.shenanigans — structural capture model

**This file is a thin pointer per `/cfd`.** The canonical model lives in the HOF
chronology at `HOF/2026/09/05/21/` as `.af.scm`/`.hof.scm` citizens, verified live in
`hof repl` (loaded from this project root: `hof repl` then `:load HOF/2026/09/05/21/<file>`).
Do not duplicate field lists, taxonomy values, or scoring logic here — read the
`.scm` file headers, which carry full Gherkin specs and provenance.

## What this tracks

Not a generic NIMBY-tactic log. Every instance in this model names three
**orthogonal** axes at once, so the model answers "who is capturing what regulation to
what price/supply effect," not just "what happened":

| Axis | "So what" | Citizen |
|---|---|---|
| Mechanism (HOW) | the specific regulation/tool wielded | `af-shenanigan-mechanism-type.af.scm` |
| Beneficiary class (WHO) | cui bono — who captures the value | `af-shenanigan-beneficiary-class.af.scm` |
| Price/supply effect (SO WHAT) | raises-prices / blocks-supply / delays-supply / both | field on `af-shenanigan-instance.af.scm` |

A single instance (`af-shenanigan-instance.af.scm`) is the composition of all three,
plus jurisdiction, target project, date, outcome, source URLs, and confidence.

## Citizens

- `af-shenanigan-instance.af.scm` — the instance constructor (all three axes + provenance)
- `af-shenanigan-beneficiary-class.af.scm` — the cui-bono taxonomy (5 classes), sourced
  from `reports/san-mateo-housing-structural-moats.md` §1.6
- `af-shenanigan-mechanism-type.af.scm` — the regulatory-tool taxonomy (7 mechanisms),
  sourced from §1.1–1.4 of the same report
- Six seeded instances (one file each): Pacifica Quarry rejection, Menlo Park ballot
  measure, CARLA v. San Mateo, Redwood City 603 Jefferson Ave, San Mateo Measure T/Y
  history, and the CEQA-as-PLA-leverage ("Jerry Brown hammer") pattern
- `hof-shenanigan-timeline.hof.scm` — filters+sorts instances into one jurisdiction's
  chronological timeline
- `hof-shenanigan-capture-score.hof.scm` — capture-intensity signal
- `hof-shenanigan-pattern-detector.hof.scm` — repeating-pattern flag feeding the app

## Capture-score design (2 sentences)

`hof:shenanigan-capture-score` takes one jurisdiction's timeline and counts how many
instances name each beneficiary class, then reports the dominant class's *share* of
that jurisdiction's own instances (high/moderate/low, with the 80%+-share threshold
from the task's own worked example) — a per-jurisdiction concentration signal, never a
countywide average, in keeping with `/pareto-razor`'s cui-bono discipline of asking
which structural cause is load-bearing *for this specific place*. `hof:shenanigan-pattern-detector`
consumes that same timeline independently and flags when 3+ discretionary/ballot-box
captures with a succeeded-or-contested outcome appear among the dated instances,
emitting a `follow-up-search-hint` string the app's decide-next-search logic can hand
directly to a Linkup query to check whether the pattern is still active.

## Verification status

Live-evaluated via `hof repl` from the project root (`cd
/mnt/ithicc/git/hackathons/housing && hof repl`, then `:load` each file in dependency
order: taxonomies → instance constructor → seeded instances → timeline → capture-score
→ pattern-detector). All twelve citizens load and evaluate without error; capture-score
and pattern-detector were exercised against the seeded instance set and returned
correct results (Pacifica alone scores `capture-intensity: high` on
`incumbent-homeowners`/`fiscally-constrained-cities`; a 2-instance sample correctly
does not trigger the 3+ pattern-detector threshold).

## Daily Diff / Changelog

Citizens live in `HOF/2026/09/05/20/`: `af-shenanigan-diff-type.af.scm` (closed enum
`new-instance` / `outcome-changed` / `status-confirmed-unchanged`),
`af-shenanigan-diff-entry.af.scm` (one diff-line record), `hof-shenanigan-daily-diff.hof.scm`
(the query — composes `hof:shenanigan-timeline`, does not reimplement instance
collection), `hof-shenanigan-changelog-render.hof.scm` (pure fold to markdown, zero
fresh LLM calls per `/deep-research`'s report-rendering pattern), and
`hof-shenanigan-changelog-write.hof.scm` (wires render to disk).

**Query system, not a maintained log**: the diff is a query over whatever
`/fundamental-ingestion` has already written to the chronology (`af-shenanigan-*.af.scm`
instances and shenanigans-tagged `.web.fact.af` records) — there is no separate
changelog data store to keep in sync.

**Run it** (from project root, `hof repl`, dependency order: taxonomies → instance
constructor → seeded/tagged instances for the two dates being compared →
`af-shenanigan-diff-type` → `af-shenanigan-diff-entry` → `hof-shenanigan-daily-diff` →
`hof-shenanigan-changelog-render` → `hof-shenanigan-changelog-write`), then call
`(hof:shenanigan-changelog-write "<YYYY-MM-DD>" (hof:shenanigan-daily-diff "<YYYY-MM-DD>" today-pool prior-pool))`
where `today-pool`/`prior-pool` are the caller-assembled lists of
`af:shenanigan-instance`-shaped alists (each augmented with `instance-ref` and
`ingested-at`) known as of each date — the same "caller passes the pool" contract
`hof:shenanigan-timeline` already uses.

**Output lands at** `HOF/<YYYY>/<MM>/<DD>/shenanigans-changelog.md`.

**Interpreter gap found during verification**: this `hof repl` build has no working
file-I/O primitives (`open-output-file`/`call-with-output-file`/`with-output-to-string`
all "undefined variable"; the pre-existing `hof:write-file` at
`HOF/2026/03/01/write-file.hof.scm` is itself broken for the same reason). The
Scheme call graph (render → write-file → disk) is complete and correct and will
materialize the file the moment file I/O lands in the interpreter; until then, the
`.md` is materialized by capturing the REPL's own stdout from
`(display (hof:shenanigan-changelog-render ...))` — documented as the interim
workaround in `hof-shenanigan-changelog-write.hof.scm`'s own header.

**Verified**: a 7th test-fixture instance
(`HOF/2026/09/05/22/af-shenanigan-test-new-instance.af.scm`, clearly marked TEST) was
added to a "today" pool built from the 6 seeded Sept 5 21:00 instances plus itself,
diffed against a "prior" pool of just the 6 seeded instances. The diff correctly
classified the fixture as `new-instance` and all 6 seeded instances as
`status-confirmed-unchanged`; the zero-entries case correctly rendered "No new
shenanigans activity detected for `<date>`." instead of an error. Date-scoping choice:
"a day changed" is defined by the caller-assembled pool boundary passed to
`hof:shenanigan-daily-diff`, not by a hard rule that new instances must land in a new
calendar-day directory — the fixture intentionally lives one hour later
(`HOF/2026/09/05/22/`) than the seeded set to model the realistic case of multiple
ingestion passes accumulating before a diff is generated.

**Not yet wired**: this is not called from `app/`'s follow-up-search pipeline yet
(future work, `app/` untouched here) and is not yet on a scheduled ingestion cadence —
both are intended follow-up integration points for `hof:shenanigan-pattern-detector`'s
existing `follow-up-search-hint` and a cron-style ingestion pass respectively.
