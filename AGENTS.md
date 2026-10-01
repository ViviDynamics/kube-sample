# Agents and Skills

## Workflow skills

This repository uses the shared workflow skills from
[ViviDynamics/skills](https://github.com/ViviDynamics/skills) at tag **2026.09.17**.
The installed skills are: vivi-conventions, ci-safety, watch-ci, watch-ci-main,
merge-pr, rebase-main, copilot-review, and ship-issue. They are copied into both
`.agents/skills/` and `.claude/skills/` (`.opencode/skill` is a symlink to the former)
and are read-only here. Do not edit them in this repository: to fix or improve a
skill, change ViviDynamics/skills, then re-copy at the new tag and update the tag
recorded above.

Repository-specific settings live in `repo.env.example` at the repository root. Copy
it to `repo.env` (gitignored) for local use:

```shell
cp repo.env.example repo.env
.agents/skills/ci-safety/scripts/check-wiring
```

Each contributor sets `VIVI_ASSIGNEE` to their own GitHub login in their local
`repo.env`, or for Claude Code in the uncommitted `.claude/settings.local.json`:

```json
{
  "env": {
    "VIVI_ASSIGNEE": "<your GitHub login>"
  }
}
```

ship-issue claims an issue by assigning it to that login before any work starts, and
stops when someone else already holds it. Left unset, the token's own login is used.
Never commit a login in `repo.env.example` or `.claude/settings.json`.

## Repository facts

- Default branch is `main`; it has no branch protection or ruleset. Pull requests are
  squash merged and the branch deleted.
- The only CI is the `Workflow skills wiring` job in
  `.github/workflows/pull-request.yml`, which runs `check-wiring` on `ubuntu-latest`.
  There is no build, lint, or test pipeline, so `VIVI_CI_WORKFLOW` is left empty.
- `.agents/test-commands.md` lists the only local verifying command (the hello-go
  Docker image build). `setup.sh` and `teardown.sh` act on a live Kubernetes cluster;
  never run them as a check.
- `.agents/flake-signatures.txt` is intentionally empty. Add a line only when it is a
  literal string from a real CI log of a failure that a rerun fixed.
- No GitHub project board is used, so `VIVI_PROJECT_NUMBER` is empty.
