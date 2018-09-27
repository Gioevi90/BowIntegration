import UIKit

class EitherViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField?
    @IBOutlet weak var phoneField: UITextField?
    
    private var presenter: EitherPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = EitherPresenter(view: self)
    }

    @IBAction func submitAction(_ sender: UIButton) {
        presenter?.validate(emailField?.text, phone: phoneField?.text)
    }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        [emailField, phoneField].forEach({ $0?.resignFirstResponder() })
    }
}

extension EitherViewController: EitherViewProtocol {
    func gotAnError(_ error: String) {
        error.show(from: self)
    }

    func show(data: Data) {
        "Email: \(data.email) Phone: \(data.phone)".show(from: self)
    }
}
