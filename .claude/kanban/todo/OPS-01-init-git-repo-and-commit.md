## OPS-01: initialize git repo and make first commits

Project directory is not yet a git repo (per project CLAUDE.md). All work so far
(reports, HOF chronology, docs, app scaffold) is uncommitted. Judges need a real
repo with commit history as velocity evidence per the hackathon skill.

**Priority**: high
**Reversibility**: reversible
**Repo**: /mnt/ithicc/git/hackathons/housing
**Scope**: `git init`, .gitignore (node_modules, .env, .next, etc.), initial commits
  split by logical unit (research reports, HOF chronology, docs, app) with
  conventional prefixes per project CLAUDE.md commit discipline.
**Done-when**: `git log` shows a real commit history; .env is gitignored (never
  committed — contains LINKUP_API_KEY).
**Agent**: @ralph-coder
**Created**: 2026-09-05
**Blocker**: human-requirement — confirm whether to push to a remote, and if so which
  (per global CLAUDE.md: never push without explicit founder request/IPC clearance).
