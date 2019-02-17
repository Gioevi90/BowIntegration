import Bow
import Foundation

public extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }

    func isValidPhone() -> Bool {
        let phoneRegEx = "[235689][0-9]{6}([0-9]{3})?"
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: self)
    }
}

public struct Field {
    public let email: String
    public let phone: String
}

public enum ValidationError: Error {
    case invalidEmail
    case invalidPhone

    public var localizedDescription: String {
        switch self {
        case .invalidEmail:
            return "The inserted email is invalid"
        case .invalidPhone:
            return "The inserted phone is invalid"
        }
    }
}

public struct Validation {
    public init() {}

    public func optionEmail(_ email: String) -> Option<String> {
        guard email.isValidEmail() else {
            return Option.none()
        }
        return Option.some(email)
    }

    public func optionPhone(_ phone: String) -> Option<String> {
        guard phone.isValidPhone() else {
            return Option.none()
        }
        return Option.some(phone)
    }

    public func optionEmailAndPhone(_ email: Option<String>, _ phone: Option<String>) -> Option<Field> {
        return Option<Field>
            .applicative()
            .map(email, phone, Field.init)
            .fix()
    }

    public func eitherEmail(_ email: String) -> Either<ValidationError, String> {
        guard email.isValidEmail() else {
            return Either.left(.invalidEmail)
        }
        return Either.right(email)
    }

    public func eitherPhone(_ phone: String) -> Either<ValidationError, String> {
        guard phone.isValidPhone() else {
            return Either.left(.invalidPhone)
        }
        return Either.right(phone)
    }

    public func eitherEmailAndPhone(_ email: Either<ValidationError, String>, phone: Either<ValidationError, String>) -> Either<ValidationError, Field> {
        return Either.fix(Either<ValidationError, Field>
            .applicative()
            .map(email, phone, Field.init))
    }

    public func validatedEmail(_ email: String) -> Validated<NonEmptyListOf<ValidationError>, String> {
        guard email.isValidEmail() else {
            return Validated.invalid(Nel.of(.invalidEmail))
        }
        return Validated.valid(email)
    }

    public func validatedPhone(_ phone: String) -> Validated<NonEmptyListOf<ValidationError>, String> {
        guard phone.isValidPhone() else {
            return Validated.invalid(Nel.of(.invalidPhone))
        }
        return Validated.valid(phone)
    }

    public func validatedEmailAndPhone(_ email: Validated<NonEmptyListOf<ValidationError>, String>, _ phone: Validated<NonEmptyListOf<ValidationError>, String>) -> Validated<[ValidationError], Field> {
        let semigroup = Nel<ValidationError>.semigroup()
        return Validated.fix(Validated<NonEmptyListOf<ValidationError>, Field>
            .applicative(semigroup)
            .map(email, phone, Field.init))
            .leftMap({ $0.fix().all() })
    }
}
