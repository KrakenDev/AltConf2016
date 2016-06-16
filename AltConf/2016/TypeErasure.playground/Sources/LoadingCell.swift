import UIKit

class LoadingCell: UITableViewCell {
    var loading: Bool = false {
        didSet {
            label.text = loading ? "Loading" : "Hooray"
        }
    }
    let label = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame = bounds
        label.textAlignment = .Center
        label.font = .italicSystemFontOfSize(40.0)
        contentView.addSubview(label)
    }
}
