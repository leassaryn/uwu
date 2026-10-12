# uwu

A personal study repository for learning Android development by following two upstream Komikku projects: an open source manga reader built with Kotlin, Jetpack Compose, and Material 3.

The goal of this repo is to learn by reading, tracing, and experimenting with real-world code. It is not intended as a production app.

## Topics to study

- **Android** fundamentals: Activities, lifecycle, services, WorkManager, notifications, storage, and permissions
- **Jetpack Compose**: composables, state (`remember`, `mutableStateOf`), side effects, navigation, and performance
- **Material 3**: theming, color schemes, typography, components, and dynamic color
- **Kotlin**: coroutines, Flow, sealed classes, and DSL patterns
- **Architecture**: ViewModels, repositories, dependency injection, and data layers
- **Build tooling**: Gradle, Kotlin DSL, version catalogs, and CI workflows

## Upstream references

| Name | URL | Description |
|------|-----|-------------|
| `upstream` | https://github.com/komikku-app/komikku | Main Komikku repository (Apache-2.0, branch `master`) |
| `upstream-xkana` | https://github.com/xkana-shii/komikku | Personal Komikku fork by xkana-shii (branch `main`). Warned to break often. |

The `origin` remote for this repo is https://github.com/leassaryn/uwu.

## Setup

Clone the upstream repos for reference:

```sh
git fetch upstream
git fetch upstream-xkana
git worktree add ../komikku-ref upstream/master
```

Requirements: Android Studio, JDK 17+, and Android SDK API 26 or higher (Komikku requires Android 8.0+).

## Study notes

Keep notes and experiments in a clear structure, for example:

- `notes/` for written study notes
- `experiments/` for small Compose or Material 3 samples

## License

This repository follows the license of the upstream project: [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0).
