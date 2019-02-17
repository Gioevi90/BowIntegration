import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Functional_ValidationTests.allTests),
    ]
}
#endif