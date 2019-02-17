import Foundation
import UIKit

class EitherCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var eitherViewController: EitherViewController?

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    func start() {
        let view = EitherViewController(nibName: nil, bundle: nil)
        let eitherPresenter = EitherPresenter(view: view)
        view.presenter = eitherPresenter
        presenter.pushViewController(view, animated: true)
        self.eitherViewController = view
    }
}
