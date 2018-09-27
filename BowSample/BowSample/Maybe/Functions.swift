import Foundation
import Bow

extension Swift.Optional where Wrapped == String {
    func optionEmail() -> Maybe<String> {
        return self.flatMap({ $0.optionEmail() }) ?? Maybe.none()
    }

    func optionPhone() -> Maybe<String> {
        return self.flatMap({ $0.optionPhone() }) ?? Maybe.none()
    }
}

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
}

func validateData(email: String?, phone: String?) -> Maybe<Data> {
    return Maybe<Data>.applicative()
        .map2(email.optionEmail(), phone.optionPhone()) { Data(email: $0, phone: $1) }
        .fix()
}
