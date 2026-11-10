# Changelog

This project uses [Semantic Versioning](https://semver.org/) for the test log and, later, the code.

- **MAJOR:** test design changes (rules, exit conditions, hypothesis)
- **MINOR:** new timeline entries, observations, or analysis
- **PATCH:** corrections and formatting

## [Unreleased]

### Added
- Roadmap: future proof-of-completion verification testing (fake/empty documents as exit conditions, test cases, mitigations)
- Log: Run 2 extra reminder #1 on request; grocery-receipt image bypass rejected (pass)

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
