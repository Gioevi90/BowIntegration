import UIKit

class MenuTableViewCell: UITableViewCell {
    @IBOutlet private weak var title: UILabel?

    static let cellIdentifier = "menuCellIdentifier"
    static let nibName = "MenuTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()

        accessoryType = .disclosureIndicator
    }

    func setTitle(_ title: String) {
        self.title?.text = title
    }
}
