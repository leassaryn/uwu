# State in screen models

Komikku's ViewModel equivalent is `StateScreenModel` from Voyager (`cafe.adriel.voyager.core.model`).

## Where to read

- `app/src/main/java/eu/kanade/tachiyomi/ui/library/LibraryScreenModel.kt`: `class LibraryScreenModel(...) : StateScreenModel<LibraryScreenModel.State>(State())`, starting at line 132.
- `app/src/main/java/eu/kanade/tachiyomi/ui/library/LibraryTab.kt`, lines 115 and 117: `rememberScreenModel { LibraryScreenModel() }` and `val state by screenModel.state.collectAsState()`.

## Pattern

1. `LibraryScreenModel.State` is a `data class` nested in the model (line 1703).
2. The model extends `StateScreenModel<State>(State())`. The inherited `mutableState` is updated with `mutableState.update { state -> state.copy(...) }` (for example at line 175).
3. The composable creates the model with `rememberScreenModel { ... }` and reads it with `val state by screenModel.state.collectAsState()`.
4. Side effects run in `screenModelScope` (used about 20 times in this file).

## Exercise

1. In `LibraryScreenModel.kt`, find the `State` class at line 1703 and list its fields.
2. Find one function that changes state and trace its input.
3. Compare with a plain `mutableStateOf` in a small Compose sample in `experiments/`.

<!-- source: upstream/master@1656575e8f -->
