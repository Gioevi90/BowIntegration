import Foundation
import Functional_Validation

struct EitherPresenter: EitherPresenterProtocol {
    let validation: Validation
    weak var view: EitherViewProtocol?

    init(view: EitherViewProtocol?) {
        self.validation = Validation()
        self.view = view
    }

    func validateEmailAndPhone(_ email: String, phone: String) {
        let eitherEmail = validation.eitherEmail(email)
        let eitherPhone = validation.eitherPhone(phone)
        let field = validation.eitherEmailAndPhone(eitherEmail,
                                                   phone: eitherPhone)
        field.fold(showError, validationSucceeded)
    }

    func showError(_ error: ValidationError) {
        view?.showError(error)
    }

    func validationSucceeded(_ field: Field) {
        view?.validationSucceded(field)
    }
}
