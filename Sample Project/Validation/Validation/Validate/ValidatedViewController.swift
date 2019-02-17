import UIKit
import Functional_Validation

class ValidatedViewController: UIViewController {
    @IBOutlet private weak var emailTextField: UITextField?
    @IBOutlet private weak var phoneTextField: UITextField?

    @IBOutlet private weak var emailInvalidLabel: UILabel?
    @IBOutlet private weak var phoneInvalidLabel: UILabel?

    var presenter: ValidatedPresenterProtocol?

    private var errorFieldsMap: [ValidationError: UILabel?] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()

        errorFieldsMap = [.invalidEmail: emailInvalidLabel,
                          .invalidPhone: phoneInvalidLabel]
        errorFieldsMap.values.forEach({ $0?.isHidden = true })

        emailTextField?.delegate = self
        phoneTextField?.delegate = self
    }

    @IBAction func proceed(_ sender: UIButton) {
        presenter?.validateEmailAndPhone(emailTextField?.text ?? "",
                                         phone: phoneTextField?.text ?? "")
    }
}

extension ValidatedViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        errorFieldsMap.values.forEach({ $0?.isHidden = true })
        return true
    }
}

extension ValidatedViewController: ValidatedViewProtocol {
    func showErrors(_ errors: [ValidationError]) {
        errors.forEach(showError)
    }

    func validationSucceded(_ field: Field) {
        UIAlertController.showMessage("Validation succeded: \n email: \(field.email) \n phone: \(field.phone)",
            in: self)
    }

    func showError(_ error: ValidationError) {
        errorFieldsMap[error]??.isHidden = false
        errorFieldsMap[error]??.text = error.localizedDescription
    }
}
