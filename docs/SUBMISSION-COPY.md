# Submission Copy — Builder's Remedy Checker
### Devpost-style copy for the Deep Research — Linkup track

---

## Elevator pitch (one line)

A live eligibility checker that tells anyone with a San Mateo County address
whether Builder's Remedy, SB9, SB35, or SB10 actually applies to their parcel
today — sourced, current, and honest about what it can't yet confirm.

---

## The problem

San Mateo County has the Bay Area's highest rate of cities without a certified
Housing Element, which means state housing-law overrides like Builder's Remedy
are live in more jurisdictions here than almost anywhere else in California —
but whether any of it applies to a specific address depends on facts (Housing
Element certification, live project rulings, ordinance adoption) that shift
month to month, and no one keeps a public, current, sourced answer.

## The solution

Builder's Remedy Checker takes an address, checks a pre-seeded research cache
built from 14-plus cities of existing housing research, and — because the brief
here is a city council vote or a court filing away from being wrong — reaches
past that cache into a live Linkup search whenever a finding might be stale or
ambiguous, storing every result with its sources and deciding, from what comes
back, exactly what to search for next, until it can hand back a sourced
eligibility memo with an explicit section for what it still can't confirm.

## Why Linkup, specifically

The whole product is a loop, not a lookup: store a finding, judge whether it's
current and unambiguous, and only then decide the next query — which is why a
one-shot web search wouldn't do the job here. Linkup is what makes that loop
possible in the first place: sourced answers with dated, attributable citations
on every call let the app tell "confirmed as of this source" apart from "cached
and possibly stale" apart from "genuinely contested right now," and that
distinction is the entire research-quality claim the product is making. We know
the failure mode firsthand — our own earlier hand-built research on this exact
county reported a 1,000-unit Builder's Remedy project as an active pipeline
success when its Planning Commission had, in fact, just rejected it 5-0. That's
precisely the kind of quiet staleness a single cached fact can't catch and a
live, source-checked Linkup follow-up search can.

## Who it's for

Renters, small-lot builders, housing advocates, and local reporters in San
Mateo County who need a current, sourced answer about a specific address —
not a static report, not a stale spreadsheet, and not a guess.

## What's shipped

A deployed, publicly usable web app: enter an address, watch it run live
research, get back a sourced memo. Anyone outside the team can use it today.

---

### Judging-criteria cross-reference (internal note, not for public copy)

- **Shipping** → "A deployed, publicly usable web app... Anyone outside the
  team can use it today."
- **Usefulness** → "The problem" section names the real user and real,
  time-sensitive stakes.
- **Research quality** → the Pacifica Quarry staleness example in "Why Linkup,
  specifically" — a concrete instance of finding missing info and flagging
  uncertainty, not a claimed capability.
- **Integration** → "The whole product is a loop, not a lookup... Linkup is
  what makes that loop possible in the first place" — states plainly why
  Linkup is structural, not swappable for plain web search.
