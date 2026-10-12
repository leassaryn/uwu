# Navigation with Voyager

Komikku and Mihon use Voyager (`cafe.adriel.voyager`), not `androidx.navigation.compose`. Version: 1.1.0-beta03 in Komikku (`gradle/libs.versions.toml`), 2.2.21 in Mihon.

## Where to read

- `app/src/main/java/eu/kanade/tachiyomi/ui/main/MainActivity.kt`: `Navigator(screen = HomeScreen, ...)` is the root, at line 263 in Komikku and line 234 in Mihon.
- `app/src/main/java/eu/kanade/presentation/util/Navigator.kt`: custom transitions (`ScreenTransition`, `DefaultNavigatorScreenTransition`).
- `app/src/main/java/eu/kanade/tachiyomi/ui/library/LibraryTab.kt`: a `Tab` that uses `rememberScreenModel`.

## Core idea

- A `Screen` is a class with a `@Composable Content()`.
- `navigator.push(screen)` and `navigator.pop()` change the stack.
- `TabNavigator` holds several tabs; each tab keeps its own state.

## Exercise

1. Follow `HomeScreen` from `MainActivity` to its `Content()`.
2. Find one screen that calls `navigator.push`. Note which screen it pushes.
3. Check how `disposeSteps = true` affects memory.
