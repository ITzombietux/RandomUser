// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RangomUSerListPackage",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Root",
            targets: ["Root"]
        ),
        .library(
            name: "Model",
            targets: ["Model"]
        ),
        .library(
            name: "Core",
            targets: ["Core"]
        ),
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]
        ),
        .library(
            name: "RandomUsers",
            targets: ["RandomUsers"]
        ),
        .library(
            name: "RandomUser",
            targets: ["RandomUser"]
        ),
        .library(
            name: "RandomUserDetail",
            targets: ["RandomUserDetail"]
        ),
        .library(
            name: "APIDependency",
            targets: ["APIDependency"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", from: .init(stringLiteral: "13.0.0")),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: .init(stringLiteral: "0.4.2")),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: .init(stringLiteral: "6.3.1"))
    ],
    targets: [
        .target(
            name: "Root",
            dependencies: [
                "RandomUsers",
            ]
        ),
        .target(
            name: "Model",
            dependencies: []
        ),
        .target(
            name: "Core",
            dependencies: []
        ),
        .target(
            name: "DesignSystem",
            dependencies: []
        ),
        .target(
            name: "RandomUsers",
            dependencies: [
                "RandomUser",
                "APIDependency"
            ]
        ),
        .target(
            name: "RandomUser",
            dependencies: [
                "RandomUserDetail",
                .product(name: "Kingfisher", package: "Kingfisher")
            ]
        ),
        .target(
            name: "RandomUserDetail",
            dependencies: []
        ),
        .target(
            name: "APIDependency",
            dependencies: [
                "Model",
                "Core",
                .product(name: "Dependencies", package: "swift-dependencies"),
                .product(name: "Moya", package: "Moya")
            ]
        ),
        .testTarget(
            name: "RangomUSerListPackageTests",
            dependencies: []),
    ]
)
