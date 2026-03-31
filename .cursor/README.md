# `.cursor` project configuration (samples)

This folder holds **project-level** Cursor settings you can commit and share. Cursor also reads user-level files under `~/.cursor/` (not in this repo).

## `hooks.json`

Defines **hooks**: external commands (or prompt-based policies) that run at stages of the Agent or Tab loop.

- **How it works:** Cursor spawns your process, sends a **JSON payload on stdin**, and reads **JSON from stdout** to allow, deny, modify, or enrich the step. Project hooks run with the **workspace root** as the working directory, so script paths should look like `.cursor/hooks/...`.
- **Reload:** Cursor watches this file and reloads when it changes.
- **Security:** Hooks run in **trusted workspaces** only; review scripts before enabling.
- **Docs:** [Hooks](https://cursor.com/docs/hooks)

Hook names you can list under `"hooks"` include (among others):

| Hook | Typical use |
|------|-------------|
| `sessionStart` / `sessionEnd` | Inject or log session lifecycle |
| `preToolUse` / `postToolUse` / `postToolUseFailure` | Gate or audit any tool (use `matcher` to filter) |
| `subagentStart` / `subagentStop` | Control Task-tool subagents |
| `beforeShellExecution` / `afterShellExecution` | Approve or log shell commands |
| `beforeMCPExecution` / `afterMCPExecution` | MCP tool policy |
| `beforeReadFile` / `afterFileEdit` | File access / post-edit formatting |
| `beforeSubmitPrompt` | Validate prompts before send |
| `preCompact` | Observe context compaction |
| `stop` | Run when a generation ends (telemetry, follow-ups) |
| `afterAgentResponse` / `afterAgentThought` | Track model output |
| `beforeTabFileRead` / `afterTabFileEdit` | Tab-specific file hooks |

Each entry can include `command`, optional `timeout`, `matcher`, `failClosed`, `loop_limit` (for some hooks), or `type: "prompt"` for LLM-evaluated policies.

## `mcp.json`

Declares **Model Context Protocol** servers for this project (tools/resources the Agent can call).

- **How it works:** Under `mcpServers`, each key is a display name; the value is either a **stdio** server (`command` + `args`, optional `env`) or a **remote** server (`url`, optional `headers`).
- **Secrets:** Prefer environment variable references in `env` rather than committing API keys.
- **Docs:** [MCP](https://cursor.com/docs/mcp) / [help](https://cursor.com/help/customization/mcp)

## `rules/`

**Project rules** are markdown (`.md` or `.mdc`) instructions merged into Agent context when applicable.

- **How it works:** Plain `.md` files are rules as-is. `.mdc` files can use **YAML frontmatter** (`description`, `globs`, `alwaysApply`) so Cursor knows when to attach the rule. Rules are **Agent (Chat) only**, not Tab.
- **Docs:** [Rules](https://cursor.com/docs/context/rules)

## `hooks/*.sh` (or other scripts)

Referenced from `hooks.json`. Must be **executable** where required (`chmod +x`). Read stdin JSON, write stdout JSON, exit `0` on success, exit `2` to block (for hooks that support deny semantics—see docs).

---

**Related files at repo root (not inside `.cursor/`):**

- **`.cursorignore`** — Like `.gitignore` syntax; limits what Cursor indexes and what AI features can access by default.
- **`.cursorindexingignore`** — Excludes paths from **indexing/search** only; files may still be reachable when referenced explicitly.
- **`AGENTS.md`** — Simple alternative to `.cursor/rules` for agent instructions.
