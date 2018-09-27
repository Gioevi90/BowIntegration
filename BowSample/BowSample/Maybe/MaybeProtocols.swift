import Foundation

protocol MaybeViewProtocol: class {
    func gotAnError()
    func show(data: Data)
}

protocol MaybePresenterProtocol {
    func validate(_ email: String?, phone: String?)
}
