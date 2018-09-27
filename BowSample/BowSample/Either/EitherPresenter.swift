import Foundation

struct EitherPresenter: EitherPresenterProtocol {
    private weak var view: EitherViewProtocol?

    init(view: EitherViewProtocol) {
        self.view = view
    }

    func validate(_ email: String?, phone: String?) {
        let data = validateData2(email: email, phone: phone)
        view.map({ data.fold($0.gotAnError, $0.show) })
    }
}
