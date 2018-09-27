import Foundation
import Bow

extension Swift.Optional where Wrapped == String {
    func eitherEmail() -> Either<String, String> {
        return self.flatMap({ $0.eitherEmail() }) ?? Either.left("Invalid email")
    }

    func eitherPhone() -> Either<String, String> {
        return self.flatMap({ $0.eitherPhone() }) ?? Either.left("Invalid phone")
    }
}

extension String {
    func eitherEmail() -> Either<String, String> {
        guard self.isValidEmail() else {
            return Either.left("Invalid email")
        }
        return Either.right(self)
    }

    func eitherPhone() -> Either<String, String> {
        guard self.isValidPhone() else {
            return Either.left("Invalid phone")
        }
        return Either.right(self)
    }
}

func validateData2(email: String?, phone: String?) -> Either<String, Data> {
    return Either.fix(Either<String, Data>.applicative().map2(email.eitherEmail(), phone.eitherPhone(), { Data(email: $0, phone: $1) }))
}
