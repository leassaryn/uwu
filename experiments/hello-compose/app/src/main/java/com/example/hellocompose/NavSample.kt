package com.example.hellocompose

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import cafe.adriel.voyager.core.model.StateScreenModel
import cafe.adriel.voyager.core.model.rememberScreenModel
import cafe.adriel.voyager.core.screen.Screen
import cafe.adriel.voyager.navigator.Navigator
import cafe.adriel.voyager.navigator.currentOrThrow
import kotlinx.coroutines.flow.update

// Study target: the same Voyager pattern as Komikku's LibraryScreenModel / LibraryTab.
// Screen -> Content(), navigator.push/pop, StateScreenModel with mutableState.update.

class CounterScreenModel : StateScreenModel<CounterScreenModel.State>(State()) {

    data class State(val count: Int = 0)

    fun increment() {
        mutableState.update { it.copy(count = it.count + 1) }
    }
}

class HomeScreen : Screen {
    @Composable
    override fun Content() {
        val navigator = Navigator.currentOrThrow
        Column(
            modifier = Modifier.fillMaxSize().padding(24.dp),
            verticalArrangement = Arrangement.Center,
            horizontalAlignment = Alignment.CenterHorizontally,
        ) {
            Text("Home", style = MaterialTheme.typography.headlineMedium)
            Button(onClick = { navigator.push(CounterScreen()) }) {
                Text("Open counter")
            }
        }
    }
}

class CounterScreen : Screen {
    @Composable
    override fun Content() {
        val navigator = Navigator.currentOrThrow
        val screenModel = rememberScreenModel { CounterScreenModel() }
        val state by screenModel.state.collectAsState()

        Column(
            modifier = Modifier.fillMaxSize().padding(24.dp),
            verticalArrangement = Arrangement.Center,
            horizontalAlignment = Alignment.CenterHorizontally,
        ) {
            Text("Count: ${state.count}", style = MaterialTheme.typography.headlineMedium)
            Button(onClick = { screenModel.increment() }) {
                Text("Increment")
            }
            Button(onClick = { navigator.pop() }) {
                Text("Back")
            }
        }
    }
}

@Composable
fun VoyagerRoot() {
    Navigator(HomeScreen())
}
