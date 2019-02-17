import Foundation
import Functional_Validation

struct ValidatedPresenter: ValidatedPresenterProtocol {
    let validation: Validation
    weak var view: ValidatedViewProtocol?

    init(view: ValidatedViewProtocol?) {
        self.view = view
        self.validation = Validation()
    }

    func validateEmailAndPhone(_ email: String, phone: String) {
        let email = validation.validatedEmail(email)
        let phone = validation.validatedPhone(phone)
        let field = validation.validatedEmailAndPhone(email, phone)
        field.fold(showErrors, validationSucceeded)
    }

    func showErrors(_ errors: [ValidationError]) {
        view?.showErrors(errors)
    }

    func validationSucceeded(_ field: Field) {
        view?.validationSucceded(field)
    }
}
