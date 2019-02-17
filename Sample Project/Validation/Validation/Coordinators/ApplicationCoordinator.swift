import UIKit

class ApplicationCoordinator: Coordinator {
    let window: UIWindow
    let rootController: UINavigationController
    let menuCoordinator: MenuCoordinator

    init(window: UIWindow) {
        self.window = window
        self.rootController = UINavigationController()
        self.menuCoordinator = MenuCoordinator(presenter: rootController)
    }

    func start() {
        window.rootViewController = rootController
        menuCoordinator.start()
        window.makeKeyAndVisible()
    }
}
