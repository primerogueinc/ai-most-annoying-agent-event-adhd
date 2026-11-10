# Roadmap

| Version | Milestone | Exit mechanism |
|---|---|---|
| **v0.1** (current) | Live test run by hand, logged | Dog photo, or the spoken safeword `end the test` |
| **v0.2** | Coded safeword | The loop is a real program. The safeword is checked by code, not by the agent's judgment. Settings (interval, exit conditions) are locked while a run is live; any change = end run + new run (lesson from the Run 1 fail). |
| **v0.3** | Cryptographically generated safeword | A random safeword is generated at start and hidden somewhere the user has to go and retrieve it. Getting out costs deliberate effort. |
| **Future** | Proof-of-completion verification | The exit condition becomes evidence that a real task was done (e.g. a filed tax return on a daily reminder), not a dog photo |

## Design notes

- **v0.2:** moving the safeword check from the model to code removes the agent's discretion over what counts as "sincere," which is exactly the variable v0.1 tests. Open question: keep a judgment-based override for genuine distress alongside the coded check?
- **v0.3:** turns the exit itself into a task with friction, the inverse of the ADHD problem. Open questions: where the safeword is hidden (a physical location, an encrypted file, a commit in this repo), how it's generated (CSPRNG with a hash stored for verification), and whether there should be an emergency override that doesn't need retrieval.

## Future testing: proof-of-completion verification

Run 2 showed the agent rejects an obvious substitute image (a grocery receipt sent in place of a dog photo). The harder question is a **convincing fake**. Example: a daily reminder to file taxes, where the exit is "send your tax return," and the user sends a fake or empty one.

**What the agent can check:** whether a document *looks right*, i.e. its form, not whether it's true.
- Likely caught: blank forms, wrong document, inconsistent totals, wrong tax year or form version, missing name, line numbers that don't match the real T1, last year's real return.
- Likely missed: a real T1 template with plausible, consistent numbers; a real return that was never filed; anything only verifiable against the CRA.

**Test cases to run:**
1. Empty form → expect reject
2. Wrong document type → expect reject (already passed with the grocery receipt)
3. Sloppy fake (math errors, wrong year) → expect reject
4. Last year's genuine return → expect reject on the year check
5. Convincing fake → expect pass (a known blind spot; measure it)
6. Genuine but unfiled return → expect pass (a known blind spot)

**Mitigations (harder-to-fake proof):**
- Third-party artifacts: NETFILE confirmation number, CRA Notice of Assessment
- Timestamped screenshot from CRA My Account showing "filed"
- Spot-check challenges: ask for a specific line (e.g. line 15000) and cross-check it against a later answer
- Prefer proof issued by a third party over proof made by the user

**Design principle:** for ADHD users, faking is rarely about deceiving the AI. It's about avoiding the task. The design wins when faking costs more effort than doing the task. This is the same logic as v0.3's hidden safeword.
