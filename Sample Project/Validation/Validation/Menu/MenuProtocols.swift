import Foundation

protocol MenuPresenterProtocol {
    func presentOption()
    func presentEither()
    func presentValidated()
}

protocol MenuViewProtocol: class {
    func presentSegue(_ identifier: String)
}
