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
            targets: ["ModKit"]),
    ],
    targets: [
        .target(
            name: "ModKit",
            dependencies: []),
        .testTarget(
            name: "ModKitTests",
            dependencies: ["ModKit"]),
    ]
)
