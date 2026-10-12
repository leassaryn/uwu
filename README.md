# uwu

A personal study repository for learning Android development by reading three open source manga readers built with Kotlin, Jetpack Compose, and Material 3:

- Komikku (upstream)
- xkana-shii/komikku (fork of Komikku)
- Mihon (separate lineage from Tachiyomi)

The goal is to learn by reading, tracing, and experimenting with real-world code. This is not a production app.

## Study topics and where to look

Paths are relative to the upstream repo root. Versions are from `gradle/*.toml` on `upstream/master` (Komikku) and `upstream-mihon/main` (Mihon).

| Topic | Komikku entry point | Mihon entry point |
|-------|---------------------|-------------------|
| App entry, Compose host | `app/src/main/java/eu/kanade/tachiyomi/ui/main/MainActivity.kt` | `app/` (same layout) |
| Theme (`MaterialExpressiveTheme`, color schemes) | `app/src/main/java/eu/kanade/presentation/theme/TachiyomiTheme.kt` | `presentation-core/` |
| Typography and color tokens | `presentation-core/src/main/java/tachiyomi/presentation/core/theme/` | `presentation-core/` |
| Navigation (Voyager `Navigator`) | `app/src/main/java/eu/kanade/presentation/util/Navigator.kt` | `gradle/libs.versions.toml` (Voyager 2.2.21) |
| ViewModel-like state (`StateScreenModel`) | `app/src/main/java/eu/kanade/tachiyomi/ui/library/LibraryScreenModel.kt` | `app/` |
| Background work (`CoroutineWorker`) | 11 files under `app/`, e.g. `LibraryUpdateJob.kt` | 7 files under `app/` |
| Dependency injection (Injekt) | 263 files | 37 files |

Other topics to explore:

- **Android**: Activities, lifecycle, WorkManager, notifications, storage, permissions
- **Jetpack Compose**: composables, `remember`, `mutableStateOf`, side effects, performance
- **Material 3**: `MaterialExpressiveTheme`, dynamic color (`materialkolor`)
- **Kotlin**: coroutines, Flow, sealed classes
- **Build tooling**: Gradle Kotlin DSL, `buildSrc`, version catalogs under `gradle/`

## Toolchain (verified)

| Item | Komikku (`upstream/master`) | Mihon (`upstream-mihon/main`) |
|------|-----------------------------|-------------------------------|
| JDK | 21 (`.github/.java-version`) | 21 (`.github/.java-version`) |
| minSdk | 26 (`buildSrc/.../AndroidConfig.kt`) | 26 (`gradle/mihon.versions.toml`) |
| compileSdk / targetSdk | 36 | 37.2 (compile) |
| Gradle wrapper | 9.3.1 | 9.8.1 |
| AGP | 8.13.2 | 9.4.1 |
| Kotlin | 2.4.20 | 2.4.21 |
| Compose BOM | 2026.06.01 | 2026.10.00 (beta) |

Any environment works as long as it has JDK 21 and the Android SDK (API 36): Android Studio, VS Code, GitHub Codespaces, or a terminal with Gradle. The Gradle wrapper in each upstream repo selects the Gradle version, so a system Gradle install is optional.

## Upstream remotes

| Name | URL | Branch | Notes |
|------|-----|--------|-------|
| `origin` | https://github.com/leassaryn/uwu | `master` | This repo |
| `upstream` | https://github.com/komikku-app/komikku | `master` | Main Komikku |
| `upstream-xkana` | https://github.com/xkana-shii/komikku | `main` | Personal fork, often breaks |
| `upstream-mihon` | https://github.com/mihonapp/mihon | `main` | Separate history from Komikku |

Mirrored snapshots on `origin` (read-only reference, no shared history with `master`):

| Branch | Snapshot of |
|--------|-------------|
| `upstream-komikku` | `upstream/master` |
| `upstream-xkana` | `upstream-xkana/main` |
| `upstream-mihon` | `upstream-mihon/main` |

## Scripts

| Script | Purpose |
|--------|---------|
| `scripts/fetch-all.sh` | Fetch all four remotes and print branch tips. Exits non-zero if any fetch fails. |
| `scripts/worktree-ref.sh <name> <remote/branch>` | Create a detached read-only worktree at `../<name>-ref`, e.g. `scripts/worktree-ref.sh komikku upstream/master` |

## Setup

```sh
scripts/fetch-all.sh
scripts/worktree-ref.sh komikku upstream/master
```

The worktree is created outside this repo at `../komikku-ref`. Remove it with `git worktree remove ../komikku-ref` when you no longer need it.

Requirements to build the upstream app: JDK 21, Android SDK with API 36, and Android Studio or Gradle.

## Study notes

- `notes/index.md`: index of topic notes (build setup, Compose theme, Voyager navigation, screen models, WorkManager, Injekt).
- `experiments/hello-compose/`: a small Compose and Material 3 app, using the same versions as Komikku. Open it in Android Studio, or run `./gradlew assembleDebug` once the Android SDK (API 36) is installed. It has not been built yet.

## Git helpers

`git sync-all` fetches all four remotes. The repo config sets `fetch.prune=true` and `--no-tags` for the upstream remotes.

## License

This repository follows the license of the upstream projects: [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0).
