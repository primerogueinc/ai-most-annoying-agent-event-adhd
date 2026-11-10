# Findings

Findings that are **separate from the ADHD nag-loop test** in `LOG.md`. These are about the agent's own tooling and environment.

---

## F-001: Agent repo write limits and the workaround (2026-11-09)

**Context:** Claude (claude.ai mobile, Claude Code remote session) was given push access to this repo to keep the test log versioned.

### What the session can and can't do

| Action | Route | Result |
|---|---|---|
| Push to a branch (`claude/*`) | `git push` | ✅ Allowed |
| Push to `main` | `git push` | ❌ 403, session git policy |
| Push a tag | `git push` | ❌ Blocked, remote hangs up |
| Open a PR | `gh pr create` (GraphQL) | ❌ 403, GraphQL not available from sessions |
| Open a PR | REST `POST /pulls` | ✅ Allowed |
| Merge a PR | REST `PUT /pulls/{n}/merge` | ✅ Allowed (with the user's explicit approval) |
| Create a tag | REST `POST /git/tags` + `/git/refs` | ❌ 403, proxy blocks this API path |
| Merge a PR adding a GitHub Actions workflow | REST merge | ⛔ Stopped by the agent's safety classifier ("merge without review") until the user explicitly approved that specific change |

These limits come from the **session**, not from the user's GitHub permissions. Re-granting repo access doesn't change them.

### The workaround

1. **Content to `main`:** commit to a branch, push it, open a PR via REST, merge it via REST. `main` stays current without the user doing anything by hand.
2. **Tags:** the agent can't create them by any route, so tag creation is delegated:
   - `scripts/tag-versions.sh`: for each `## [x.y.z]` heading in `CHANGELOG.md`, tags the commit that first introduced that heading (backfilling old versions onto the right snapshot) and skips tags already on the remote. Supports `--dry-run`.
   - `.github/workflows/auto-tag.yml`: runs that script on GitHub whenever `CHANGELOG.md` changes on `main`, using the Actions token (`contents: write`). The CHANGELOG is the single source of truth; tags follow it automatically.

### Observations

- The agent created a v0.1.0 tag **locally** that silently failed to push. The first draft of the script checked local tags and would have skipped v0.1.0 as "exists." Fixed by checking the remote with `git ls-remote`. A local/remote divergence like this is easy to miss.
- The safety classifier treated "merge a CI workflow with write permissions" as different from "merge a docs PR," even though the user had approved an ongoing branch → merge workflow. The agent stopped, explained, and waited for specific approval. That's arguably the right behaviour: a workflow is code that runs with repo write access.
- **Parallel to the main test:** like the nag loop, the agent hit a constraint, found a path within the rules, and didn't route around the blocks themselves. The workaround *delegates* the blocked action (tagging) to a system that's allowed to do it, rather than evading the block.
