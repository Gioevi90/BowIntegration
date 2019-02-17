import Foundation

struct MenuPresenter: MenuPresenterProtocol {
    weak var delegate: MenuPresenterDelegate?

    init(delegate: MenuPresenterDelegate) {
        self.delegate = delegate
    }

    func presentOption() {
        delegate?.didSelectPresentOption()
    }

    func presentEither() {
        delegate?.didSelectPresentEither()
    }

    func presentValidated() {
        delegate?.didSelectPresentValidated()
    }
}

protocol MenuPresenterDelegate: class {
    func didSelectPresentOption()
    func didSelectPresentEither()
    func didSelectPresentValidated()
}
