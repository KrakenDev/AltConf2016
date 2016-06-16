import UIKit

class TransactionDetailViewController: UIViewController {
    var delegate: AnyCellReloadable<Transaction>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: view.bounds)
        button.titleLabel?.font = .italicSystemFontOfSize(40.0)
        button.setTitle("Hey, AltConf!", forState: .Normal)
        button.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
        view.addSubview(button)
    }
    
    func buttonTapped() {
        delegate?.didFinishEditing(true, newObject: Transaction())
        navigationController?.popViewControllerAnimated(true)
    }
}
