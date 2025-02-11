// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XYZAuthKit",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "XYZAuthKit",
            targets: ["XYZAuthKit"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "XYZAuthKit",
            path: "Sources/XYZAuthKit.xcframework"
        ),
    ]
)
