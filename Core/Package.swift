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
    ],
    dependencies: [
        .package(url: "https://github.com/oconnelltoby/UserDataValidation.git", .branch("master")),
    ],
    targets: [
        .target(
            name: "Localization",
            resources: [.process("Resources")]
        ),
        .target(
            name: "Interface",
            dependencies: ["Localization"]
        ),
        .target(
            name: "Domain",
            dependencies: ["UserDataValidation"]
        ),
        .target(
            name: "Integration",
            dependencies: ["Localization", "Domain", "Interface"]
        ),
        .target(
            name: "Scenarios",
            dependencies: ["Interface", "Integration"]
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: ["Domain", "Scenarios"]
        ),
        .testTarget(
            name: "IntegrationTests",
            dependencies: ["Integration", "Scenarios"]
        ),
        .testTarget(
            name: "InterfaceTests",
            dependencies: ["Interface"]
        ),
        .testTarget(
            name: "ScenariosTests",
            dependencies: ["Scenarios"]
        ),
        .testTarget(
            name: "LocalizationTests",
            dependencies: ["Localization"]
        ),
    ]
)
