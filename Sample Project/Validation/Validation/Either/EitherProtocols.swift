import Foundation
import Functional_Validation

protocol EitherPresenterProtocol {
    func validateEmailAndPhone(_ email: String, phone: String)
}

protocol EitherViewProtocol: class {
    func showError(_ error: ValidationError)
    func validationSucceded(_ field: Field)
}
