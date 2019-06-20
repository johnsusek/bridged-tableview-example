import SwiftUI

class MyTableViewController<Data, Content>: UITableViewController where Data: RandomAccessCollection, Content: View, Data.Element: Identifiable {
  let renderFunc: ForEach<Data, Content>

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
    let data = renderFunc.data
    let todo1 = data.first as! Data.Element.IdentifiedValue
    let result = renderFunc.content(todo1)

    let hc = UIHostingController(rootView: result)
    hc.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.6000000238)
    hc.view.frame = CGRect(x: 0, y: 0, width: 380, height: 43)

    for subview in cell.contentView.subviews {
      subview.removeFromSuperview()
    }

    cell.contentView.addSubview(hc.view)
    return cell
  }

  init(renderFunc: ForEach<Data, Content>) {
    self.renderFunc = renderFunc
    super.init(style: UITableView.Style.plain)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
  }
}
