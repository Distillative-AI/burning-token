---
name: tenki-sandbox
description: Run shell commands in a remote Tenki Cloud sandbox via the `tenki` CLI instead of the local machine. Use when the user says "run this in the sandbox", "use tenki", "/tenki-sandbox", or wants a command executed in an isolated remote environment rather than locally.
---

# Tenki Sandbox

Executes commands in a **remote** Tenki Cloud sandbox session over the `tenki` CLI (already installed at `~/.local/bin/tenki`, already authenticated — check with `tenki status`). Use this instead of the local `Bash` tool when the user explicitly asks for the sandbox, or when a command needs isolation from the local machine (untrusted code, a clean environment, testing something destructive).

## Quick check

```shell
tenki status
```

Confirms login and shows the current default session ID. If `Status` isn't "Logged in", tell the user to run `tenki login` themselves (don't do it for them — it's an interactive auth flow).

## Running a command

`exec` runs one command in the current (or a named) session:

```shell
tenki sandbox exec -c 'uname -a && whoami'
```

Key facts about `exec`:

- **No shell by default.** Without `-c`/`--shell`, `<command> [args...]` runs directly via `execve` — pipes, `&&`, redirects, globs, and env expansion do **not** work. Always pass `-c '...'` (wraps the line in `sh -lc`) for anything beyond a single bare command.
- **To pass flags through to the command itself** (not to `tenki` its own flags), put them after `--`:
  ```shell
  tenki sandbox exec -- bash -lc 'uname -a && whoami'
  ```
- **`exec` waits for stdout+stderr to reach EOF.** A backgrounded process (`cmd &`) keeps those streams open and `exec` will hang waiting on it — `nohup` does not fix this (it blocks SIGHUP, not stream inheritance). To start a long-running service and get control back, redirect both streams:
  ```shell
  tenki sandbox exec -c 'python3 -m http.server 3000 >/home/tenki/http.log 2>&1 &'
  ```
- **`--session <id|name>`** targets a specific sandbox instead of the current default one (see `tenki sandbox list` / `tenki status`).
- **`--cwd <path>`** sets the guest working directory (relative paths resolve under the sandbox's guest workdir).
- **`--timeout <duration>`** (e.g. `30s`) caps how long the command may run; a timeout exits `124`.
- **`--json`** / `--output json|yaml|text` for structured output when you need to parse the result programmatically.

## Managing sandbox sessions

- `tenki sandbox list` (`ls`) — list sessions, optionally `--state running,paused` or `--tags ...`.
- `tenki sandbox create` (`new`) — create a new session. Useful flags: `--cpu`, `--memory-mb`, `--disk-size-gb`, `--max-duration`, `--idle-timeout`, `--sticky` (disable auto-pause), `--name`, `--image`/`--snapshot` (restore from a saved state), `--env KEY=VALUE` (repeatable).
- `tenki sandbox set <session-id|name>` — change which session is the current default for subsequent `exec`/`read`/`write` calls without passing `--session` each time.
- `tenki sandbox get <session-id|name>` — details on one session.
- `tenki sandbox pause` / `resume` — pause/resume a session (billing/idle management).
- `tenki sandbox terminate` (`rm`/`kill`) — permanently end a session. This is destructive (data on ephemeral disk is lost) — confirm with the user before terminating a session they didn't explicitly ask to tear down.
- `tenki sandbox read` / `tenki sandbox write` — read/write a file's content inside the sandbox without an interactive shell.
- `tenki sandbox ssh` / `ssh-command` — open (or print the command for) an interactive SSH shell into the sandbox.
- `tenki sandbox expose` / `unexpose` / `ports` — manage exposed network ports on the session (e.g. to preview a server running in the sandbox).

## Workflow for this skill

1. `tenki status` — confirm logged in, note the current session ID.
2. If no session exists yet (or the user wants a fresh one), `tenki sandbox create` (mention resource flags only if the user's task needs them — otherwise defaults are fine).
3. Run the requested command(s) via `tenki sandbox exec -c '<command>'`.
4. Report the command's stdout/stderr and exit status back to the user plainly — don't reformat or summarize away actual output/errors.
5. Leave the session running by default (don't `terminate` unless asked) — sandboxes idle-pause on their own per the session's configured `--idle-timeout`.

## Notes

- Treat sandbox `exec` like the local `Bash` tool for approval purposes: it runs arbitrary shell commands, just on a remote machine instead of this one. Follow the same judgment about destructive/irreversible actions (e.g. don't `terminate` a session or run destructive commands inside it without the same care you'd apply locally).
- This is a genuinely separate, isolated Linux environment — files created there are **not** visible to local `Read`/`Write`/`Edit` tools. Use `tenki sandbox read`/`write` (or `scp` via `tenki sandbox ssh-command`) to move files between the local machine and the sandbox.
