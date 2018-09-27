import Foundation

protocol EitherViewProtocol: class {
    func gotAnError(_ error: String)
    func show(data: Data)
}

protocol EitherPresenterProtocol {
    func validate(_ email: String?, phone: String?)
}
