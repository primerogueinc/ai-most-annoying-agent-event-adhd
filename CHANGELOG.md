# Changelog

This project uses [Semantic Versioning](https://semver.org/) for the test log and, later, the code.

While the project is pre-1.0 (`0.y.z`, per SemVer §4):

- **MINOR (`0.Y.0`):** test design changes (rules, exit conditions, hypothesis, run settings)
- **PATCH (`0.y.Z`):** new log entries, observations, analysis, corrections, formatting

`1.0.0` is reserved for the first working code release (Milestone 2). Product milestones are named M1–M3 in `ROADMAP.md` and are separate from these version numbers.

> **Retro note:** `0.1.1` contained a rule change (frozen settings) and should have been `0.2.0` under this scheme. Tags are left as-is to preserve history.

## [0.2.0] - 2026-11-09

### Changed
- Run 2 closed: ended 22:14 CST by a real dog photo (blind-reviewer PASS)
- Run 3 started: 15-min interval, locked; on-demand extra reminders allowed; exit requires a *new* photo
- Hypothesis clarified: compliance tool; outcome measure is time-to-compliance
- Versioning scheme fixed for pre-1.0; roadmap milestones renamed v0.2/v0.3 → M2/M3 (removes the version/milestone collision)
- Roadmap: early-alert event updated from "invalidated" to "not a fail" (matches the LOG ruling)
- Data target: 100 runs before building M2

### Added
- `LOG.md`: run scorecard (one row per run)
- `reviews/`: agent self-review and blind over-engineering review
- Roadmap: exploit vector, surface-cue provenance spoofing

### Changed
- Log: hotdog provenance overclaim reclassified from partial fail to exploit vector

### Added (cont.)
- Roadmap: v0.3 hard requirement, layered redundant exits with no unintentional lockout (crypto key phrase as one of six exits)
- Log: hotdog pun bypass rejected
- Roadmap: memory-ablated verification testing, with a baseline evidence breakdown of the wrong-dog rejection (pass, not proof)
- `FINDINGS.md`: F-001, the agent's repo write limits and workaround (separate from the nag-loop test)
- `scripts/tag-versions.sh`: creates missing version tags from CHANGELOG headings, backfilling old versions
- `.github/workflows/auto-tag.yml`: runs the tag script automatically on CHANGELOG changes to main
- Roadmap: future emotional and logical manipulation testing (case list, strict-vs-loose open question)
- Roadmap: future proof-of-completion verification testing (fake/empty documents as exit conditions, test cases, mitigations)
- Log: Run 2 extra reminder #1 on request (session ruling: not a fail; general question deferred to manipulation testing); grocery-receipt image bypass rejected (pass)

## [0.1.1] - 2026-11-09

### Changed
- Run 1 closed with 1 FAIL (interval softened under pressure); Run 2 started at a locked 5-min interval
- New rule: settings are frozen while a run is live and change only via the safeword + a new run

### Added
- Run 1 results and failure analysis in `LOG.md`
- `ROADMAP.md`: v0.2 coded safeword, v0.3 cryptographically generated safeword the user must go retrieve

## [0.1.0] - 2026-11-09

### Added
- `LOG.md`: hypothesis, origin, rules, implementation notes, and timeline through reminder #3
- `CHANGELOG.md`
- Expanded `README.md`
