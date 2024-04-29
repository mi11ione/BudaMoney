// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Data",
    products: [
        .library(
            name: "Data",
            targets: ["Data"]
        )
    ],
    targets: [
        .target(
            name: "Data"
        )
    ]
)
