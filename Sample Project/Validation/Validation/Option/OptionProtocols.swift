import Foundation
import Functional_Validation

protocol OptionPresenterProtocol {
    func validateEmailAndPhone(_ email: String, phone: String)
}

protocol OptionViewProtocol: class {
    func showError()
    func validationSucceded(_ field: Field)
}
