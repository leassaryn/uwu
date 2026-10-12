# Build setup

Source: `upstream/master` (Komikku), `upstream-mihon/main` (Mihon).

## Versions (verified)

| Item | Komikku | Mihon |
|------|---------|-------|
| JDK | 21 (`.github/.java-version`) | 21 (`.github/.java-version`) |
| minSdk | 26 (`buildSrc/src/main/kotlin/mihon/buildlogic/AndroidConfig.kt`) | 26 (`upstream-mihon/main:gradle/mihon.versions.toml`) |
| compileSdk / targetSdk | 36 (same file) | compile 37.2 (`upstream-mihon/main:gradle/mihon.versions.toml`) |
| Gradle wrapper | 9.3.1 (`gradle/wrapper/gradle-wrapper.properties`) | 9.8.1 (`upstream-mihon/main:gradle/wrapper/gradle-wrapper.properties`) |
| AGP | 8.13.2 (`gradle/androidx.versions.toml`) | 9.4.1 (`upstream-mihon/main:gradle/libs.versions.toml`) |
| Kotlin | 2.4.20 (`gradle/kotlinx.versions.toml`) | 2.4.21 (`upstream-mihon/main:gradle/libs.versions.toml`) |
| Compose BOM | 2026.06.01 (`gradle/compose.versions.toml`) | 2026.10.00 beta (`upstream-mihon/main:gradle/libs.versions.toml`) |

## Where things live

- `app/build.gradle.kts`: module config, build types, `applicationId` (`app.komikku` in Komikku).
- `gradle/` version catalogs (`*.versions.toml`). Komikku splits them into `androidx`, `compose`, `kotlinx`, `libs`, `sy`.
- `buildSrc/`: shared Android config as Kotlin objects (Komikku).
- `gradle/build-logic/`: convention plugins (Mihon).

## Modules

Komikku top-level modules: `app`, `core`, `core-metadata`, `data`, `domain`, `presentation-core`, `presentation-widget`, `source-api`, `source-local`, `i18n`, `i18n-kmk`, `i18n-sy`, `flagkit`, `macrobenchmark`, `telemetry`.

Mihon top-level modules: `app`, `baseline-profile`, `core`, `core-metadata`, `data`, `domain`, `presentation-core`, `presentation-widget`, `source-api`, `source-local`, `i18n`, `icons`, `fastlane`.

Layering (both): `domain` holds business logic, `data` holds the database and repositories, `presentation-*` holds Compose UI, `app` wires everything together.

## Try it

```sh
scripts/worktree-ref.sh komikku upstream/master
cd ../komikku-ref
./gradlew tasks
```

Needs JDK 21 and the Android SDK (API 36). The first build downloads a lot.

<!-- source: upstream/master@1656575e8f -->
<!-- source: upstream-mihon/main@143a060ac9 -->
