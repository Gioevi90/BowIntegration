import Foundation
import Functional_Validation

struct OptionPresenter: OptionPresenterProtocol {
    let validation: Validation
    weak var view: OptionViewProtocol?

    init(view: OptionViewProtocol?) {
        self.validation = Validation()
        self.view = view
    }

    func validateEmailAndPhone(_ email: String, phone: String) {
        let optionEmail = validation.optionEmail(email)
        let optionPhone = validation.optionPhone(phone)

        let field = validation.optionEmailAndPhone(optionEmail,
                                                   optionPhone)
        field.fold(showError, validateField)
    }

    func showError() {
        view?.showError()
    }

    func validateField(_ field: Field) {
        view?.validationSucceded(field)
    }
}
