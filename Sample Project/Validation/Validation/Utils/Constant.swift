import Foundation

struct Constant {
    static let segueIdentifier = SegueIdentifier()
    static let dataType = DataType()
}

struct SegueIdentifier {
    let option = "optionSegueIdentifier"
    let either = "eitherSegueIdentifier"
    let validated = "validatedSegueIdentifier"
}

struct DataType {
    let option = "Option"
    let either = "Either"
    let validated = "Validated"
}


