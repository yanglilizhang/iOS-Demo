import UIKit

class ViewController_Block: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView(frame: UIScreen.main.bounds)
    var contentArray = ["Block_1", "Block_2", "Block_3", "Block_4", "Block_5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell_block.self)
        
        navigationItem.title = "Block"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell_block = tableView.dequeueReusableCell(for: indexPath)
        cell.setupCell(content: contentArray[indexPath.row])
        cell.buttonBlock = {
            let vc = SecViewController()
            vc.textLabel.text = self.contentArray[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
    }

}
