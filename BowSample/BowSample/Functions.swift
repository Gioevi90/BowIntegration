import Foundation
import Bow

extension String {
    func optionEmail() -> Maybe<String> {
        guard self.isValidEmail() else {
            return Maybe.none()
        }
        return Maybe.some(self)
    }

    func optionPhone() -> Maybe<String> {
        guard self.isValidPhone() else {
            return Maybe.none()
        }
        return Maybe.some(self)
    }

    private func isValidEmail() -> Bool {
        return true
    }

    private func isValidPhone() -> Bool {
        return true
    }
}

func validateData(email: String, phone: String) -> Maybe<Data> {
    return Maybe<Data>.applicative()
        .map2(email.optionEmail(), phone.optionPhone()) { Data(email: $0, phone: $1) }
        .fix()
}
