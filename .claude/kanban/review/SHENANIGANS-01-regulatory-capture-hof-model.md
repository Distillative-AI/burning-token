## SHENANIGANS-01: housing.shenanigans regulatory-capture HOF model

Track "structural unfair advantage capturing regulations to drive housing prices
higher or prevent affordable housing supply" (user's framing) as a CFD-first HOF
model: mechanism x beneficiary-class x price-supply-effect, three orthogonal axes.

**Priority**: high
**Reversibility**: reversible
**Repo**: /mnt/ithicc/git/hackathons/housing
**Scope**: HOF/2026/09/05/<hour>/ citizens — af-shenanigan-instance.af.scm,
  af-shenanigan-beneficiary-class.af.scm, af-shenanigan-mechanism-type.af.scm,
  hof-shenanigan-timeline.hof.scm, hof-shenanigan-capture-score.hof.scm,
  hof-shenanigan-pattern-detector.hof.scm. Seed 5-6 real instances from
  reports/san-mateo-housing-structural-moats.md Section 1.6 (cui bono) and the
  Pacifica Quarry rejection. Thin pointer at docs/SHENANIGANS-MODEL.md.
**Done-when**: files written, well-formed Scheme verified, docs pointer written,
  capture-score design documented for app follow-up-search integration.
**Agent**: general-purpose (dispatched as aac238f6c2bf11d26)
**Created**: 2026-09-05
**Claimed-By**: aac238f6c2bf11d26
**Claim-Time**: 2026-09-05T13:05:00Z
**Commit**: (uncommitted — see OPS-01)
**Review**: PASS — 12 files at HOF/2026/09/05/21/, all live-evaluated in `hof repl`
  (one bug caught+fixed: memq -> member, undefined in this interpreter). 6 seeded
  instances incl. one capture-defeated case (CARLA v. San Mateo) for contrast.
  capture-score correctly returned "high" for Pacifica; pattern-detector correctly
  returned #f below 3-instance threshold. Needs @pm validation + wiring into APP-01's
  follow-up-search logic (hof:shenanigan-pattern-detector emits a
  follow-up-search-hint string ready for that integration — not yet wired).
