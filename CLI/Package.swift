// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CLI",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .executable(name: "cli", targets: ["CLI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/SwiftLint", from: "0.39.1"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.44.4"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.4.0"),
        .package(url: "https://github.com/JohnSundell/ShellOut.git", from: "2.0.0"),
    ],
    targets: [
        .target(
            name: "CLI",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "ShellOut", package: "ShellOut"),
            ]
        ),
    ]
)
