import UIKit

extension String {
    func isValidEmail() -> Bool {
        return true
    }

    func isValidPhone() -> Bool {
        return true
    }
}

extension String {
    func show(from view: UIViewController) {
        let alertController = UIAlertController.init(title: nil, message: self, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        view.present(alertController, animated: true, completion: nil)
    }
}
