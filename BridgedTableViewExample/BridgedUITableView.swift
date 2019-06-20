import SwiftUI

struct BridgedUITableView<Data, Content>: UIViewControllerRepresentable where Data: RandomAccessCollection, Content: View, Data.Element: Identifiable {
  let renderFunc: ForEach<Data, Content>

  func makeUIViewController(context: UIViewControllerRepresentableContext<BridgedUITableView>) -> UITableViewController {
    let tvc = MyTableViewController<Data, Content>(renderFunc: renderFunc)
    return tvc
  }

  func updateUIViewController(_ uiViewController: UITableViewController, context: UIViewControllerRepresentableContext<BridgedUITableView>) {}

  init(_ forEach: () -> ForEach<Data, Content>) {
    renderFunc = forEach()
  }

  func makeCoordinator() -> Coordinator {
    return Coordinator(self)
  }

  class Coordinator {
    var parent: BridgedUITableView

    init(_ view: BridgedUITableView) {
      self.parent = view
    }
  }
}
