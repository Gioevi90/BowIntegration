import UIKit
import Bow

class MaybeViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField?
    @IBOutlet weak var phoneField: UITextField?

    private var presenter: MaybePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = MaybePresenter(view: self)
    }

    @IBAction func submitAction(_ sender: UIButton) {
        presenter?.validate(emailField?.text, phone: phoneField?.text)
    }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        [emailField, phoneField].forEach({ $0?.resignFirstResponder() })
    }
}

extension MaybeViewController: MaybeViewProtocol {
    func gotAnError() {
        "Got an error: wrong email or phone".show(from: self)
    }

    func show(data: Data) {
        "Email: \(data.email) Phone: \(data.phone)".show(from: self)
    }
}
