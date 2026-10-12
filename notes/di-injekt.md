# Dependency injection with Injekt

Komikku and Mihon use Injekt (`uy.kohesive.injekt`, a fork at `com.github.mihonapp:injekt`), not Koin or Hilt. Komikku uses it in about 263 files, Mihon in about 37.

## Where to read

- `app/src/main/java/eu/kanade/tachiyomi/di/AppModule.kt`: `class AppModule : InjektModule`, registers singletons with `addSingleton` and `addSingletonFactory`.
- `app/src/main/java/eu/kanade/tachiyomi/di/PreferenceModule.kt`: preference registrations.
- `app/src/main/java/eu/kanade/domain/DomainModule.kt`: use-case and repository bindings.
- `TachiyomiTheme.kt`: example of `Injekt.get<UiPreferences>()` inside a composable.

## Pattern

1. Declare a module that implements `InjektModule` and registers types in `registerInjectables()`.
2. Retrieve dependencies with `Injekt.get<T>()` or `by injectLazy()`.

## Exercise

1. Open `AppModule.kt` and list five registrations.
2. Find one place that calls `Injekt.get` and trace where the type is registered.

<!-- source: upstream/master@1656575e8f -->
