// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "pokemon_design_system",
    platforms: [
        .iOS(.v26),
        .macOS(.v15),
        .tvOS(.v18),
        .watchOS(.v11),
        .visionOS(.v2)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "pokemon_design_system",
            targets: ["pokemon_design_system"]
        ),
    ],
    dependencies: [
        // If pokemon_shared is a local package in your workspace, adjust the path accordingly.
        .package(name: "pokemon_shared", path: "../pokemon_shared"),
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "3.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "pokemon_design_system",
            dependencies: [
                .product(name: "pokemon_shared", package: "pokemon_shared"),
                .product(name: "SDWebImageSwiftUI", package: "SDWebImageSwiftUI")
            ]
        ),
        .testTarget(
            name: "pokemon_design_systemTests",
            dependencies: ["pokemon_design_system"]
        ),
    ]
)
