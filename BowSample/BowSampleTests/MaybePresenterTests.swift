import XCTest
@testable import BowSample

class MaybePresenterTests: XCTestCase {
    var view: MaybeViewMock?

    var sut: MaybePresenter?

    override func setUp() {
        super.setUp()

        view = MaybeViewMock()
        sut = MaybePresenter(view: view!)
    }

    func testValidateDataWithInvalidMail() {
        sut?.validate("email", phone: "3331254346")

        XCTAssertEqual(view?.counterGotAnError, 1)
    }

    func testValidateDataWithInvalidPhone() {
        sut?.validate("email@email.org", phone: "12345678")

        XCTAssertEqual(view?.counterGotAnError, 1)
    }

    func testValidateDataWithInvalidMailAndPhone() {
        sut?.validate(nil, phone: "12+342è+")

        XCTAssertEqual(view?.counterGotAnError, 1)
    }

    func testValidateDataSuccess() {
        sut?.validate("email@email.org", phone: "3331254346")

        XCTAssertEqual(view?.counterShow, 1)
    }
}
