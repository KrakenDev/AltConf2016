import UIKit

public class HomeViewController: UIViewController, CellReloadable {
    private let tableView = UITableView()
    
    //CellReloadable Properties
    public var selectedIndexPath: NSIndexPath?
    public var loadingCellObjects: [NSIndexPath : Transaction] = [:]
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    public func didFinishEditing(updated: Bool, newObject: Transaction) {
        guard let indexPath = selectedIndexPath else { return }
        
        loadingCellObjects[indexPath] = updated ? newObject : nil
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate {
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedIndexPath = indexPath
        
        //Push Transaction Detail VC
        let transactionDetail = TransactionDetailViewController()
        transactionDetail.delegate = AnyCellReloadable(self)
        navigationController?.pushViewController(transactionDetail, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = LoadingCell()
        cell.loading = loadingCellObjects[indexPath] != nil
        return cell
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75.0
    }
}
