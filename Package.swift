// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Network",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Network",
            targets: ["Network"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mikeshep/lm-dog-Domain", from: "1.0.2"),
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "13.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Network",
            dependencies: []),
        .testTarget(
            name: "NetworkTests",
            dependencies: ["Network"]),
    ]
)
