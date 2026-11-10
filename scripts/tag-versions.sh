#!/usr/bin/env bash
# tag-versions.sh: create missing vX.Y.Z tags from CHANGELOG.md.
#
# For every released heading "## [x.y.z]" in CHANGELOG.md, tags the commit that
# first introduced that heading (so old versions are backfilled onto the right
# snapshot). Skips tags that already exist. Safe to re-run.
#
# Why this exists: Claude sessions on this repo can't create tags (git push of
# tags and the GitHub tags API are both blocked by the session proxy). See
# FINDINGS.md, finding F-001. Run this from any environment with normal push
# access, or wire it into a GitHub Action later.
#
# Usage: scripts/tag-versions.sh [--dry-run]
set -euo pipefail
DRY=0; [ "${1:-}" = "--dry-run" ] && DRY=1
cd "$(git rev-parse --show-toplevel)"
git fetch --tags --force -q origin
git fetch -q origin main
grep -oE '^## \[[0-9]+\.[0-9]+\.[0-9]+\]' CHANGELOG.md | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | while read -r v; do
  tag="v$v"
  if git ls-remote --exit-code --tags origin "refs/tags/$tag" >/dev/null 2>&1; then echo "skip   $tag (exists on remote)"; continue; fi
  sha=$(git log origin/main --reverse --format=%H -S "## [$v]" -- CHANGELOG.md | head -1)
  [ -z "$sha" ] && { echo "warn   $tag: no commit introduces '## [$v]' on main, skipping"; continue; }
  if [ $DRY -eq 1 ]; then echo "would  $tag -> ${sha:0:7}"; continue; fi
  git tag -a "$tag" "$sha" -m "$tag (tagged from CHANGELOG.md)"
  git push -q origin "refs/tags/$tag"
  echo "tagged $tag -> ${sha:0:7}"
done
