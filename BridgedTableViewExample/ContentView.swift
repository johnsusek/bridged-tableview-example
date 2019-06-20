import SwiftUI

struct ContentView : View {
  var todos: [Int: Todo] = [
    22: Todo(id: 22, name: "Cut the lawn", done: false),
    23: Todo(id: 23, name: "Clean the gutters", done: false),
    24: Todo(id: 24, name: "Take out garbage", done: false)
  ]

  var body: some View {
    BridgedUITableView() {
      ForEach(todos.map { $1 }) { _ in
        HStack() {
          Text("Tap me:")
          Button(action: {}) { Text("OK!") }
        }
      }
    }
  }
}
