import Foundation
import UIKit

class ValidatedCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var validatedViewController: ValidatedViewController?

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    func start() {
        let view = ValidatedViewController(nibName: nil, bundle: nil)
        let validatedPresenter = ValidatedPresenter(view: view)
        view.presenter = validatedPresenter
        presenter.pushViewController(view, animated: true)
        self.validatedViewController = view
    }
}
