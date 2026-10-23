
#!/usr/bin/env bash
set -Eeuo pipefail

# Source remote branch -> destination branch on origin
BRANCHES=(
    "upstream master upstream/master"
    "upstream-xkana main upstream-xkana/main"
    "upstream-mihon main upstream-mihon/main"
)

echo "==> Fetch all remotes"
git fetch --all --prune

for entry in "${BRANCHES[@]}"; do
    read -r remote source dest <<< "$entry"

    echo
    echo "==> Sync $remote/$source -> origin/$dest"

    if ! git show-ref --verify --quiet "refs/remotes/$remote/$source"; then
        echo "SKIP: Remote branch tidak ditemukan"
        continue
    fi

    git push origin \
        "refs/remotes/$remote/$source:refs/heads/$dest"

    echo "OK: origin/$dest updated"
done

echo
echo "==> All upstream branches synced"
