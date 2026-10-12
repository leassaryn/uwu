# Study notes index

Paths are relative to the upstream repo root unless marked otherwise. Verify against the commit you are reading; upstream changes often.

| # | Topic | Note |
|---|-------|------|
| 1 | Project layout and build setup | [build-setup.md](build-setup.md) |
| 2 | Compose theme and Material 3 | [compose-theme.md](compose-theme.md) |
| 3 | Navigation with Voyager | [navigation-voyager.md](navigation-voyager.md) |
| 4 | State in screen models | [state-screenmodel.md](state-screenmodel.md) |
| 5 | Background work with WorkManager | [background-work.md](background-work.md) |
| 6 | Dependency injection with Injekt | [di-injekt.md](di-injekt.md) |
| 7 | Testing (JUnit, Kotest, MockK) | [testing.md](testing.md) |
| 8 | Glossary | [glossary.md](glossary.md) |

Practice project: [`experiments/hello-compose`](../experiments/hello-compose/). It has a Compose counter (`MainActivity.kt`) and a Voyager two-screen sample (`NavSample.kt`). Build it once an Android SDK is installed.

Verify cited paths with `scripts/check-notes.sh`. (This index cites local files only, so it has no upstream source marker.)

Suggested order: 1, then 2, 3, 4. Then 5 and 6.

