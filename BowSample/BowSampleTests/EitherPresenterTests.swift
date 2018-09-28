import XCTest
@testable import BowSample

class EitherPresenterTests: XCTestCase {
    var view: EitherViewMock?

    var sut: EitherPresenter?

    override func setUp() {
        super.setUp()

        view = EitherViewMock()
        sut = EitherPresenter(view: view!)
    }

    func testValidateDataWithInvalidMail() {
        view?.handlerGotAnError = { error in
            XCTAssertEqual(error, "Invalid email")
        }

        sut?.validate("email", phone: "3331254346")

        XCTAssertEqual(view?.counterGotAnError, 1)
    }

    func testValidateDataWithInvalidPhone() {
        view?.handlerGotAnError = { error in
            XCTAssertEqual(error, "Invalid phone")
        }

        sut?.validate("email@email.org", phone: "12345678")

        XCTAssertEqual(view?.counterGotAnError, 1)
    }

    func testValidateDataWithInvalidMailAndPhone() {
        view?.handlerGotAnError = { error in
            XCTAssertEqual(error, "Invalid email")
        }

        sut?.validate(nil, phone: "12+342è+")

        XCTAssertEqual(view?.counterGotAnError, 1)
    }

    func testValidateDataSuccess() {
        view?.handlerShow = { data in
            XCTAssertEqual(data.email, "email@email.org")
            XCTAssertEqual(data.phone, "3331254346")
        }

        sut?.validate("email@email.org", phone: "3331254346")

        XCTAssertEqual(view?.counterShow, 1)
    }
}

