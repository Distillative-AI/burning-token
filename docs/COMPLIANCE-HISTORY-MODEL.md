# Housing Element Compliance — Time-Series Model

Thin pointer per /cfd. Source of truth is the chronology, not this file.

## Chronology citizens

`HOF/2026/09/05/17/`:

- `af-compliance-status.af.scm` — `af:compliance-status?` enum guard: `compliant` |
  `non-compliant` | `decertified` | `pending-recertification`
- `af-compliance-status-change.af.scm` — `af:compliance-status-change` atomic event record
  (jurisdiction, status, effective-date, prior-status, reason, source-urls, confidence)
- `hof-jurisdiction-compliance-history.hof.scm` — `hof:jurisdiction-compliance-history`,
  the real per-city extraction from all 21 `HOF/sources/<city>/eligibility-snapshot.md`
  files, folded into a chronologically-sorted event list per jurisdiction (multi-event arcs
  captured in full, e.g. Portola Valley: non-compliant -> compliant -> decertified ->
  pending-recertification; Brisbane: non-compliant -> compliant -> decertified)
- `hof-compliance-status-as-of.hof.scm` — `hof:compliance-status-as-of jurisdiction date`,
  walks one jurisdiction's history and returns the status in effect at a given date
- `hof-countywide-compliance-snapshot.hof.scm` — `hof:countywide-compliance-snapshot date`,
  applies the above across all 21 jurisdictions for the full county picture at any date

## Why this exists

`reports/fact-check-verification.md` flagged the original report's "8 non-compliant
jurisdictions as of Sept 2024" claim as stale prose with an unverifiable exact roster.
Querying `(hof:countywide-compliance-snapshot "2024-09-01")` reconstructs that roster from
real per-city HCD certification/decertification dates: atherton, belmont, daly-city,
half-moon-bay, pacifica, san-bruno, unincorporated-county, woodside — 8 jurisdictions,
matching the original claim's named list exactly — plus portola-valley showing
`decertified` (a 9th, historically real data point the original snapshot-style claim
could not have captured since it decertified on 2024-03-26, before recertifying and then
being decertified again).

`(hof:countywide-compliance-snapshot "2026-09-05")` (today) gives the current picture:
daly-city and half-moon-bay still non-compliant, brisbane decertified (2026-07-01), portola-valley
pending-recertification, and the remaining 17 jurisdictions compliant.

Verified evaluating live in `hof repl` 2026-09-05.
