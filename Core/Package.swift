// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Core",
    defaultLocalization: "en",
    platforms: [
        .iOS("14.0"),
    ],
    products: [
        .library(
            name: "Common",
            targets: ["Common"]
        ),
        .library(
            name: "Localization",
            targets: ["Localization"]
        ),
        .library(
            name: "Interface",
            targets: ["Interface"]
        ),
        .library(
            name: "Domain",
            targets: ["Domain"]
        ),
        .library(
            name: "Integration",
            targets: ["Integration"]
        ),
        .library(
            name: "Scenarios",
            targets: ["Scenarios"]
        ),
        .library(
            name: "TestSupport",
            targets: ["TestSupport"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/oconnelltoby/UserDataValidation.git", .branch("master")),
    ],
    targets: [
        .target(
            name: "Common"
        ),
        .target(
            name: "Localization",
            resources: [.process("Resources")]
        ),
        .target(
            name: "Interface",
            dependencies: ["Common", "Localization"]
        ),
        .target(
            name: "Domain",
            dependencies: ["Common", "UserDataValidation"]
        ),
        .target(
            name: "Integration",
            dependencies: ["Common", "Localization", "Domain", "Interface"]
        ),
        .target(
            name: "Scenarios",
            dependencies: ["Common", "Interface", "Integration"]
        ),
        .target(
            name: "TestSupport"
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: ["TestSupport", "Domain", "Scenarios"]
        ),
        .testTarget(
            name: "IntegrationTests",
            dependencies: ["TestSupport", "Integration", "Scenarios"]
        ),
        .testTarget(
            name: "InterfaceTests",
            dependencies: ["TestSupport", "Interface"]
        ),
        .testTarget(
            name: "ScenariosTests",
            dependencies: ["TestSupport", "Scenarios"]
        ),
        .testTarget(
            name: "LocalizationTests",
            dependencies: ["TestSupport", "Localization"]
        ),
    ]
)
