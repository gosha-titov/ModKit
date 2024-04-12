// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ModKit",
    platforms: [
      .macOS(.v12), .iOS(.v13)
    ],
    products: [
        .library(
            name: "ModKit",
            type: .dynamic,
            targets: ["ModKit"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ModKit",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "ModKitTests",
            dependencies: ["ModKit"],
            path: "Tests"
        ),
    ]
)
