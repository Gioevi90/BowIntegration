import UIKit

class MenuTableView: UITableView {
    override func awakeFromNib() {
        super.awakeFromNib()

        register(UINib(nibName: MenuTableViewCell.nibName,
                        bundle: nil),
                 forCellReuseIdentifier: MenuTableViewCell.cellIdentifier)
        separatorStyle = .none
        contentInset = UIEdgeInsets(top: 50,
                                    left: 0,
                                    bottom: 0,
                                    right: 0)
    }
}
