import UIKit

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }

    func isValidPhone() -> Bool {
        let phoneRegEx = "[235689][0-9]{6}([0-9]{3})?"
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: self)
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
