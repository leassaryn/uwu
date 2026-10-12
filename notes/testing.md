# Testing

<!-- source: upstream/master@1656575e8f -->

Source: `upstream/master` (Komikku). Compared against `upstream-mihon/main`.

## What the projects use

| Tool | Version (Komikku) | Use |
|------|-------------------|-----|
| JUnit Jupiter | 6.1.3 | Test runner (`gradle/libs.versions.toml`) |
| Kotest assertions | 6.2.1 | `shouldBe` matchers |
| MockK | 1.14.11 | Mocking |
| AndroidX Test JUnit | 1.3.0 (Mihon) | Android test helpers (Mihon only in the catalog) |

Upstream does not include `compose-ui-test`, `createComposeRule`, or Robolectric. Compose UI is not tested with UI tests here. Test coverage is in the domain layer.

## Where the tests are

- `domain/src/test/java/tachiyomi/domain/...`: about 5 modules' worth of unit tests (chapter recognition, missing chapters, library flags, fetch interval, release).
- `app/src/test/java/...`: smaller set (`ScreenSerializationTest.kt`, `MigratorTest.kt`).
- `macrobenchmark/`: performance benchmarks, not unit tests.

## Example: ChapterRecognitionTest

`domain/src/test/java/tachiyomi/domain/chapter/service/ChapterRecognitionTest.kt` shows the pattern:

- `@Execution(ExecutionMode.CONCURRENT)` runs tests in parallel.
- Each test is a backticked sentence, e.g. ``Basic Ch prefix``.
- Assertions use Kotest matchers: `shouldBe`.

## Exercise

1. Read `ChapterRecognitionTest.kt` and find one case that tests a decimal chapter.
2. Write a similar test for `hello-compose`'s `Counter` logic. Move the logic out of the composable into a plain class so it can be tested without Android.
