// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "FeatureConverter",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "FeatureConverter",
            targets: ["FeatureConverter"]
        )
    ],
    dependencies: [
        .package(path: "../CoreArch"),
        .package(path: "../CoreUI"),
        .package(path: "../CoreDI"),
        .package(path: "../Extensions"),
        .package(path: "../Data"),
        .package(url: "https://github.com/hmlongco/Factory.git", from: "2.3.0"),
    ],
    targets: [
        .target(
            name: "FeatureConverter",
            dependencies: [
                "CoreArch",
                "CoreUI",
                "CoreDI",
                "Extensions",
                "Data",
                "Factory",
            ]
        ),
        .testTarget(
            name: "FeatureConverterTests",
            dependencies: ["FeatureConverter"]
        )
    ]
)
