import UIKit
import Functional_Validation

class OptionViewController: UIViewController {
    @IBOutlet private weak var emailTextField: UITextField?
    @IBOutlet private weak var phoneTextField: UITextField?

    var presenter: OptionPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func proceed(_ sender: UIButton) {
        presenter?.validateEmailAndPhone(emailTextField?.text ?? "",
                                         phone: phoneTextField?.text ?? "")
    }
}

extension OptionViewController: OptionViewProtocol {
    func showError() {
        UIAlertController.showMessage("Validation error",
                                      in: self)
    }

    func validationSucceded(_ field: Field) {
        UIAlertController.showMessage("Validation succeded: \n email: \(field.email) \n phone: \(field.phone)",
                                      in: self)
    }
}
