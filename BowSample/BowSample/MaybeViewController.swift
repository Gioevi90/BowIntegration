import UIKit
import Bow

class MaybeViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField?
    @IBOutlet weak var phoneField: UITextField?

    @IBAction func submitAction(_ sender: UIButton) {
        let data = validateData(email: emailField?.text ?? "", phone: phoneField?.text ?? "")
        data.fold(handleNone, handleSome)
    }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        [emailField, phoneField].forEach({ $0?.resignFirstResponder() })
    }

    private func handleNone() {
        print("Got an error: wrong email or phone")
    }

    private func handleSome(data: Data) {
        print("Email: \(data.email) Phone: \(data.phone)")
    }
}

