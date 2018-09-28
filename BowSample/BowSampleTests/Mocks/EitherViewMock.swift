@testable import BowSample

class EitherViewMock: EitherViewProtocol {
    var counterGotAnError: Int = 0
    var counterShow: Int = 0

    var handlerGotAnError: ((String) -> Void)?
    var handlerShow: ((Data) -> Void)?

    func gotAnError(_ error: String) {
        counterGotAnError += 1
        handlerGotAnError?(error)
    }

    func show(data: Data) {
        counterShow += 1
        handlerShow?(data)
    }
}
