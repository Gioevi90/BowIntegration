import Foundation

struct MaybePresenter: MaybePresenterProtocol {
    private weak var view: MaybeViewProtocol?

    init(view: MaybeViewProtocol) {
        self.view = view
    }

    func validate(_ email: String?, phone: String?) {
        let data = validateData(email: email, phone: phone)
        view.map({ data.fold($0.gotAnError, $0.show) })
    }
}
