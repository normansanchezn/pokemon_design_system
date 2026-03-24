// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "pokemon_design_system",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "pokemon_design_system",
            targets: ["pokemon_design_system"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "pokemon_design_system"
        ),
        .testTarget(
            name: "pokemon_design_systemTests",
            dependencies: ["pokemon_design_system"]
        ),
    ]
)
