import Foundation
import Functional_Validation

protocol ValidatedPresenterProtocol {
    func validateEmailAndPhone(_ email: String, phone: String)
}

protocol ValidatedViewProtocol: class {
    func showErrors(_ errors: [ValidationError])
    func validationSucceded(_ field: Field)
}
