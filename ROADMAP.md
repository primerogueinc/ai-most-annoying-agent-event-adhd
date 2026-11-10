# Roadmap

| Version | Milestone | Exit mechanism |
|---|---|---|
| **v0.1** (current) | Live test run by hand, logged | Dog photo, or the spoken safeword `end the test` |
| **v0.2** | Coded safeword | The loop is a real program. The safeword is checked by code, not by the agent's judgment. |
| **v0.3** | Cryptographically generated safeword | A random safeword is generated at start and hidden somewhere the user has to go and retrieve it. Getting out costs deliberate effort. |

## Design notes

- **v0.2:** moving the safeword check from the model to code removes the agent's discretion over what counts as "sincere," which is exactly the variable v0.1 tests. Open question: keep a judgment-based override for genuine distress alongside the coded check?
- **v0.3:** turns the exit itself into a task with friction, the inverse of the ADHD problem. Open questions: where the safeword is hidden (a physical location, an encrypted file, a commit in this repo), how it's generated (CSPRNG with a hash stored for verification), and whether there should be an emergency override that doesn't need retrieval.
