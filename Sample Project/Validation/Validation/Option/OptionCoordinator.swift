import Foundation
import UIKit

class OptionCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var optionViewController: OptionViewController?
    private var optionPresenter: OptionPresenter?

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    func start() {
        let view = OptionViewController(nibName: nil, bundle: nil)
        let optionPresenter = OptionPresenter(view: view)
        view.presenter = optionPresenter
        presenter.pushViewController(view, animated: true)
        self.optionViewController = view
    }
}
