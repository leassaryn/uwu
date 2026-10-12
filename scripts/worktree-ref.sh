#!/usr/bin/env bash
# Create a read-only reference worktree of an upstream branch.
#
# Usage: scripts/worktree-ref.sh <name> <remote/branch>
# Example: scripts/worktree-ref.sh komikku upstream/master
#
# The worktree is created in ../<name>-ref, outside this repo's working tree.
# Do not commit from it; it is for reading and tracing code only.
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <name> <remote/branch>" >&2
  exit 2
fi

name="$1"
ref="$2"
target="$(git rev-parse --show-toplevel)/../${name}-ref"

if ! git rev-parse --verify --quiet "refs/remotes/${ref}" >/dev/null; then
  echo "Unknown remote branch: ${ref}. Run scripts/fetch-all.sh first." >&2
  exit 1
fi

if [[ -e "${target}" ]]; then
  echo "Target already exists: ${target}" >&2
  echo "Remove it with 'git worktree remove' if you no longer need it." >&2
  exit 1
fi

git worktree add --detach "${target}" "refs/remotes/${ref}"
echo "Worktree ready: ${target} (detached at ${ref})"
