import UIKit

class MenuCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var menuViewController: MenuViewController?
    private var menuPresenter: MenuPresenter?
    private let optionCoordinator: OptionCoordinator
    private let eitherCoordinator: EitherCoordinator
    private let validatedCoordinator: ValidatedCoordinator

    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.optionCoordinator = OptionCoordinator(presenter: presenter)
        self.eitherCoordinator = EitherCoordinator(presenter: presenter)
        self.validatedCoordinator = ValidatedCoordinator(presenter: presenter)
    }

    func start() {
        let menuPresenter = MenuPresenter(delegate: self)
        let menuViewController = MenuViewController(nibName: nil, bundle: nil)
        menuViewController.presenter = menuPresenter
        presenter.pushViewController(menuViewController, animated: true)
        self.menuViewController = menuViewController
    }
}

extension MenuCoordinator: MenuPresenterDelegate {
    func didSelectPresentOption() {
        optionCoordinator.start()
    }

    func didSelectPresentEither() {
        eitherCoordinator.start()
    }

    func didSelectPresentValidated() {
        validatedCoordinator.start()
    }
}
