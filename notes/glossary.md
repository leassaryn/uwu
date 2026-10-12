# Glossary

Terms used in the Komikku and Mihon codebases.

| Term | Meaning | Where it appears |
|------|---------|------------------|
| Voyager | Compose navigation library (`cafe.adriel.voyager`). Uses `Navigator`, `Screen`, and `TabNavigator`. | `MainActivity.kt`, `LibraryTab.kt` |
| Screen | A Voyager destination. Implements `Content()` as a `@Composable`. | `navigation-voyager.md` |
| ScreenModel | State holder tied to a Voyager `Screen`'s lifecycle. Comparable to a ViewModel. | `LibraryScreenModel.kt` |
| StateScreenModel | `ScreenModel` subclass with a `mutableState` to update. | `LibraryScreenModel.kt:132` |
| screenModelScope | Coroutine scope cancelled when the screen is disposed. | `LibraryScreenModel.kt` |
| Injekt | Dependency-injection library (`uy.kohesive.injekt`). Registers singletons in `InjektModule` classes. | `AppModule.kt`, `DomainModule.kt` |
| InjektModule | Interface that registers injectables in `registerInjectables()`. | `AppModule.kt` |
| MaterialExpressiveTheme | Material 3 Expressive root composable, used in `TachiyomiTheme.kt`. | `TachiyomiTheme.kt` |
| MaterialKolor | Library (`com.materialkolor`) that derives a full color scheme from one seed color. | `TachiyomiTheme.kt` |
| Seed color | Single color that MaterialKolor expands into a palette. Komikku uses the cover color. | `TachiyomiTheme.kt` |
| CoroutineWorker | WorkManager worker that runs `doWork()` on a coroutine. | `LibraryUpdateJob.kt` |
| Feed | Komikku screen for recent updates from all sources. | README of Komikku |
| Migration | Moving a library entry to a different source. | `MigrateMangaScreen.kt` |
| Tracker | External service (AniList, MyAnimeList, etc.) that syncs reading progress. | `app/src/main/java/eu/kanade/tachiyomi/data/track/` |
| KMK / SY | Comments in the code (`// KMK -->`, `// SY -->`) that mark code added by Komikku or SY-specific changes. Useful when diffing against Mihon. | Throughout `app/` |
| Preview build | Pre-release build from `komikku-preview`. | Upstream CI |
