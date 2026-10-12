#!/usr/bin/env bash
# Verify that file paths cited in notes/*.md exist at the upstream commit the note was written against.
#
# Source markers (one or more per note):
#   <!-- source: upstream/master@1656575e8f -->
#   <!-- source: upstream-mihon/main@143a060ac9 -->
#
# A backticked path is checked against:
#   - the marker whose remote matches a "remote:path" prefix, if written that way (e.g. upstream-mihon/main:gradle/x.toml), or
#   - otherwise the first marker in the note.
# Globs and paths without a slash are skipped.
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

status=0

for note in notes/*.md; do
  mapfile -t markers < <(grep -oE 'source: [^ ]+@[0-9a-f]+' "${note}" | sed 's/^source: //' || true)
  if [[ ${#markers[@]} -eq 0 ]]; then
    continue
  fi

  for m in "${markers[@]}"; do
    sha="${m#*@}"
    if ! git cat-file -e "${sha}^{commit}" 2>/dev/null; then
      echo "FAIL ${note}: commit ${sha} not in repo" >&2
      status=1
    fi
  done

  while IFS= read -r ref; do
    want=""
    file="${ref}"
    for m in "${markers[@]}"; do
      r="${m%@*}"
      if [[ "${ref}" == "${r}:"* ]]; then
        want="${r}"
        file="${ref#"${r}:"}"
        break
      fi
    done
    file="${file%%:[0-9]*}"

    [[ "${file}" == */* && "${file}" != *'*'* ]] || continue

    sha=""
    for m in "${markers[@]}"; do
      r="${m%@*}"
      if [[ -z "${want}" || "${r}" == "${want}" ]]; then
        sha="${m#*@}"
        break
      fi
    done
    if [[ -z "${sha}" ]]; then
      echo "FAIL ${note}: no source marker for ${ref}" >&2
      status=1
      continue
    fi

    if git cat-file -e "${sha}:${file}" 2>/dev/null; then
      echo "ok   ${note}: ${file} @${sha}"
    else
      echo "FAIL ${note}: ${file} not found at ${sha}" >&2
      status=1
    fi
  done < <(grep -oE '`[^`]+\.(kt|kts|toml|md|properties|xml|sh|java)(:[0-9]+)?`' "${note}" | tr -d '`' | sort -u)
done

exit "${status}"
