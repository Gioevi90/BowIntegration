import Foundation

struct MaybePresenter: MaybePresenterProtocol {
    let view: MaybeViewProtocol

    init(view: MaybeViewProtocol) {
        self.view = view
    }

    func validate(_ email: String?, phone: String?) {
        let data = validateData(email: email, phone: phone)
        data.fold(view.gotAnError, view.show)
    }
}
