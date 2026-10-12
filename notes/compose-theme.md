# Compose theme and Material 3

## Where to read

- `app/src/main/java/eu/kanade/presentation/theme/TachiyomiTheme.kt`: the top-level `TachiyomiTheme` composable. It reads user preferences via Injekt and calls `BaseTachiyomiTheme`.
- `app/src/main/java/eu/kanade/presentation/theme/colorscheme/`: one file per palette (Catppuccin, Nord, Tako, Monet, and others).
- `app/src/main/java/eu/kanade/domain/ui/model/AppTheme.kt`: enum of available themes.
- `presentation-core/src/main/java/tachiyomi/presentation/core/theme/Color.kt` and `Typography.kt`: shared tokens.

## Key API

- `MaterialExpressiveTheme`: Material 3 Expressive root, used in `TachiyomiTheme.kt`.
- `DynamicMaterialExpressiveTheme` from `com.materialkolor`: builds a full color scheme from a single seed color. Used for theme-by-cover.
- The seed-color overload of `TachiyomiTheme(seedColor, ...)` is the cover-based theme (`// KMK -->` marks Komikku-specific code).

## Exercise

1. Open `TachiyomiTheme.kt`. Trace how `appTheme` and `amoled` fall back to preferences.
2. Find one palette file and compare it with `TachiyomiColorScheme`.
3. Find where `MaterialTheme.typography` is read in a screen, e.g. `ExtensionDetailsScreen.kt`.

## Mihon

Mihon has its theme in `presentation-core` and the app module. Diff the two to see how theming moved between modules.
