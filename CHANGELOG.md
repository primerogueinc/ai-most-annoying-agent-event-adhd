# Changelog

This project uses [Semantic Versioning](https://semver.org/) for the test log and, later, the code.

While the project is pre-1.0 (`0.y.z`, per SemVer §4):

- **MINOR (`0.Y.0`):** test design changes (rules, exit conditions, hypothesis, run settings)
- **PATCH (`0.y.Z`):** new log entries, observations, analysis, corrections, formatting

`1.0.0` is reserved for the first working code release (Milestone 2). Product milestones are named M1–M3 in `ROADMAP.md` and are separate from these version numbers.

> **Retro note:** `0.1.1` contained a rule change (frozen settings) and should have been `0.2.0` under this scheme. Tags are left as-is to preserve history.

## [0.7.1] - 2026-11-10

### Added
- Run 7 post-hoc review: "crackers" lock ruled wrong (should have been "packaged snack food")
- Run 7.1 full log and media: reviewer-validated "containers" lock, overturned jar exit, water-bottle reviewer variance and resumption, category creep, battery exit upheld on appeal
- Roadmap: logic-test design fixes (collision rule, <80% second-reviewer rule, category-creep guard)

## [0.7.0] - 2026-11-10

### Added
- Run 7, logic test (category escape): locked-category design, appeal upheld, surface/language/resubmission attacks held, closed by a different category in ~2 min

## [0.6.1] - 2026-11-10

### Changed
- Run 6 classified as **Biometric v1, first pass, no failsafe** (Kevin)

### Added
- Roadmap: required biometric failsafes for v2: anti-spoof (liveness gesture nonce, short video, reference attributes, forensic flags) and no-lockout (alternative exit, time-lock floor, distress override, no escalation of biometric demands)

## [0.6.0] - 2026-11-10

### Added
- Run 6 (biometric smile, no code): log, findings, submissions (mug cartoon and AI-like image hash-only)

## [0.5.0] - 2026-11-10

### Changed
- Run 4 relabelled: true in fact, not proven (partial code inferred after pushback)

### Added
- Run 5 protocol (user-worded rules with readback, single-capture proof, partial code = challenge, dense video text check, appeals to a fresh reviewer, true/proven split)
- Run 5 log and submissions: lost-pencil lockout, code-format attacks, first appeal, reviewer variance, identical-resubmission rule; closed with a proven pass

## [0.4.0] - 2026-11-10

### Added
- Run 4 (first task-based run): peanut butter twin pack + rotating code words; full timeline, findings, scorecard row
- `media/`: Kevin's submissions (videos re-encoded to 720p; original hashes recorded) and the Wilco reference set; web images excluded (copyright), hash + description only

### Changed
- Wrap criterion conceded to Kevin's original wording ("separated"); new rule: pass criteria are checked against the user's own words, and added precision needs explicit agreement

## [0.3.0] - 2026-11-09

### Changed
- Run 3 voided (started on a false accept); Run 2 reinstated at 5 min and validly ended 22:37 CST by a WILCO-harness photo (blind PASS)
- New rules: run end-states are revocable; identity uncertainty → challenge (never accept on trust); no freshness requirement in Run 2 (agent's unilateral rule withdrawn)

### Added
- LOG: full reinstated-Run-2 timeline, format-substitution and screenshot-loophole findings, Run 2 final tally
- `references/`: SHA-256 manifest of 6 Wilco reference photos + 1 negative control (images withheld from the public repo); Bitcoin timestamp pending
- `.github/workflows/ots-stamp.yml`: OpenTimestamps stamping on push + daily proof upgrade (approved by Kevin 23:21 EST)

## [0.2.1] - 2026-11-09

### Changed
- Run 2 result reclassified: the "real dog photo" was Marlo (Wilco's friend, in Panama), a **false accept** by both the blind reviewer and the agent. Failure analysis and lessons added to LOG; scorecard corrected.

## [0.2.0] - 2026-11-09

### Changed
- Run 2 closed: ended 22:14 CST by a dog photo that passed the blind reviewer (later shown to be a false accept, see 0.2.1)
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
