#!/usr/bin/env bash
# Fetch all remotes and print the tip of each upstream branch.
# Read-only with respect to code: only updates remote-tracking refs.
set -euo pipefail

REMOTES=(origin upstream upstream-xkana upstream-mihon)
failed=0

for remote in "${REMOTES[@]}"; do
  echo "==> fetch ${remote}"
  if ! git fetch --prune --no-tags "${remote}"; then
    echo "!! fetch failed: ${remote}" >&2
    failed=1
  fi
done

echo
echo "==> branch tips"
git for-each-ref --format='%(refname:short)  %(objectname:short)  %(committerdate:short)' \
  refs/remotes/upstream/master \
  refs/remotes/upstream-xkana/main \
  refs/remotes/upstream-mihon/main \
  refs/remotes/origin/master

exit "${failed}"
