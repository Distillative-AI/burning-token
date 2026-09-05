# housing-tracker (Claude Code plugin)

Packages the ingestion methodology behind the [burning-token](https://github.com/Distillative-AI/burning-token)
Housing Tracker — the real, sourced, verified pipeline that took its data from 6 to 21
San Mateo County jurisdictions in one fanout — as a reusable `/housing-tracker` command
and a portable `housing-tracker` Agent Skill.

## Install (Claude Code)

```
/plugin marketplace add Distillative-AI/burning-token
/plugin install housing-tracker
```

## Use

```
/housing-tracker serve                 # clone/update the chronology, run the UI locally
/housing-tracker ingest "Palo Alto"    # research + author sourced records for a new city
```

## What's actually reusable here

- **`skills/housing-tracker/SKILL.md`** — the ingestion methodology itself: the data
  schema, the three-rule verification discipline (direct document, independently fetched
  and content-matched, no fabrication), and the classification heuristics. Written to be
  usable by any Agent Skills-compatible implementer, not Claude-Code-specific.
- **`commands/housing-tracker.md`** — the `/housing-tracker` slash command wiring that
  skill into Claude Code specifically.

See the main repo's [README](../../README.md) for the overall system architecture and
data-flow diagrams.
