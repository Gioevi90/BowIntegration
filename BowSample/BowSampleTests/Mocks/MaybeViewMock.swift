@testable import BowSample

class MaybeViewMock: MaybeViewProtocol {
    var counterGotAnError: Int = 0
    var counterShow: Int = 0

    var handlerGotAnError: (() -> Void)?
    var handlerShow: ((Data) -> Void)?

    func gotAnError() {
        counterGotAnError += 1
        handlerGotAnError?()
    }

    func show(data: Data) {
        counterShow += 1
        handlerShow?(data)
    }
}
