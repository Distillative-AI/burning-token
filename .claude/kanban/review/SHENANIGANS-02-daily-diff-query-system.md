## SHENANIGANS-02: shenanigans daily diff/changelog query system

Track shenanigans as a queryable "diff" of what changed each day, rendered as a
markdown changelog, sourced from /fundamental-ingestion's immutable .web.fact.af
records (not a separately-maintained log).

**Priority**: high
**Reversibility**: reversible
**Repo**: /mnt/ithicc/git/hackathons/housing
**Scope**:
  - `hof-shenanigan-daily-diff.hof.scm` — query composing over the existing
    `hof-shenanigan-timeline.hof.scm` model (HOF/2026/09/05/21/): for a given date,
    find all `af-shenanigan-instance` facts (and any raw .web.fact.af ingested that
    day tagged with a shenanigans-relevant domain/tag) under `HOF/<date>/*/`, diff
    against the prior day's known instance set, and classify each as `new-instance`,
    `outcome-changed` (e.g. capture-contested -> capture-succeeded/-defeated), or
    `status-confirmed-unchanged`.
  - `af-shenanigan-diff-entry.af.scm` — one diff-line record: date, instance-ref,
    diff-type, before-state (if outcome-changed), after-state, source-urls.
  - `hof-shenanigan-changelog-render.hof.scm` — renders one day's diff entries to
    `HOF/<date>/shenanigans-changelog.md` (human-consumable summary, per the
    /deep-research report-rendering pattern — regenerable from the chronology
    without a fresh LLM call, since it's a pure fold over existing .af.scm citizens).
  - Wire ingestion: new shenanigan-relevant findings from /fundamental-ingestion (or
    the app's own Linkup follow-up searches) should be written as
    `af-shenanigan-instance` citizens (or tagged appropriately) so they show up in
    the next day's diff automatically — this is the actual "query system" requirement,
    not a one-off report.
**Done-when**: running the diff query for a date with >=1 new/changed instance
  produces a correct changelog .md; running it for a date with no new ingestion
  produces an empty/no-change changelog (not an error); verified against the 6
  existing seeded instances plus at least 1 newly-ingested test instance to prove
  the diff actually detects a change.
**Agent**: general-purpose (HOF/cfd-first authoring, same conventions as SHENANIGANS-01)
**Created**: 2026-09-05
**Depends**: SHENANIGANS-01-regulatory-capture-hof-model (in review)
