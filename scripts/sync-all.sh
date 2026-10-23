#!/usr/bin/env bash
set -Eeuo pipefail

BRANCHES=(
    "upstream master upstream/master"
    "upstream-xkana main upstream-xkana"
    "upstream-mihon main upstream-mihon"
)

echo "==> Fetch all remotes"
git fetch --all --prune

for entry in "${BRANCHES[@]}"; do
    read -r remote source dest <<< "$entry"

    echo
    echo "==> Sync $remote/$source -> origin/$dest"

    ref="refs/remotes/$remote/$source"

    if ! git show-ref --verify --quiet "$ref"; then
        echo "SKIP: $ref tidak ditemukan"
        continue
    fi

    git push origin "$ref:refs/heads/$dest"

    echo "OK: origin/$dest updated"
done

echo
echo "==> All upstream branches synced"
