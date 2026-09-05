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
