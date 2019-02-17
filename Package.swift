// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Functional Validation",
    products: [
        .library(
            name: "Functional Validation",
            targets: ["Functional Validation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/bow-swift/bow.git", from: "0.3.0")
    ],
    targets: [
        .target(
            name: "Functional Validation",
            dependencies: [
                "Bow"]),
        .testTarget(
            name: "Functional ValidationTests",
            dependencies: ["Functional Validation"]),
    ]
)
