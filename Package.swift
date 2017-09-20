// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "BitUnits",
    products: [
        .library(
            name: "BitUnits",
            targets: ["BitUnits"]),
        ],
    targets: [
        .target(
            name: "BitUnits",
            dependencies: []),
        .testTarget(
            name: "BitUnitsTests",
            dependencies: ["BitUnits"]),
        ]
)

