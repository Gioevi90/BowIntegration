import UIKit
import Functional_Validation

class EitherViewController: UIViewController {
    @IBOutlet private weak var emailTextField: UITextField?
    @IBOutlet private weak var phoneTextField: UITextField?

    var presenter: EitherPresenterProtocol?

    @IBAction func proceed(_ sender: UIButton) {
        presenter?.validateEmailAndPhone(emailTextField?.text ?? "",
                                         phone: phoneTextField?.text ?? "")
    }
}

extension EitherViewController: EitherViewProtocol {
    func showError(_ error: ValidationError) {
        UIAlertController.showMessage(error.localizedDescription,
                                      in: self)
    }

    func validationSucceded(_ field: Field) {
        UIAlertController.showMessage("Validation succeded: \n email: \(field.email) \n phone: \(field.phone)",
            in: self)
    }
}
