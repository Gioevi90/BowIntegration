import UIKit

class MenuViewController: UIViewController {
    @IBOutlet private weak var tableView: MenuTableView?

    private var dataSource: MenuTableViewDatasource?
    var presenter: MenuPresenterProtocol?

    private var segueActions: [String: (() -> Void)?] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = MenuTableViewDatasource(view: self)

        tableView?.dataSource = dataSource
        tableView?.delegate = dataSource

        segueActions = [Constant.segueIdentifier.option: presenter?.presentOption,
                        Constant.segueIdentifier.either: presenter?.presentEither,
                        Constant.segueIdentifier.validated: presenter?.presentValidated]
    }
}

extension MenuViewController: MenuViewProtocol {
    func presentSegue(_ identifier: String) {
        segueActions[identifier]??()
    }
}

