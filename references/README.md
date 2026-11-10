# References

Identity references for exit-photo verification. **The images are kept off this public repo.** They'd reveal location (OPSEC) and become valid fakes anyone could resubmit. Only their SHA-256 hashes are published (`MANIFEST.sha256`).

- **Identity check:** submissions are compared against the private reference images. Wilco: brindle coat, white chest, white feet with speckled legs, floppy ears; large (~65 lb at 9 months).
- **Freshness is separate:** references prove *which dog*, not *when*. Exit photos still need to be new (a liveness code word in frame, per the roadmap), otherwise a reference image itself passes.
- **Negative control:** the Run 2 false-accept photo (Marlo, a merle) is hashed too, so it can be recognised if it's resubmitted.
- **Bitcoin timestamp:** pending. OpenTimestamps calendars are unreachable from the agent's session (network allowlist), so stamping needs to run on GitHub Actions or locally (`ots stamp references/MANIFEST.sha256`). Until then, the git commit is the only (GitHub-trusted) timestamp.
- Hashes are of the bytes as uploaded to the Claude app. Originals on the phone may differ if the app re-encoded them.
