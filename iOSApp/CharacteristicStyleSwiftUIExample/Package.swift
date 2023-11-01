// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CharacteristicStyleSwiftUIExample",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "AppFeature", targets: ["AppFeature"]),
        .library(name: "Extension", targets: ["Extension"]),
        .library(name: "Infrastructure", targets: ["Infrastructure"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess", from: "4.2.2")
    ],
    targets: [
        .target(name: "AppFeature"),
        .target(name: "Extension"),
        .target(
            name: "Infrastructure",
            dependencies: [
                .product(name: "KeychainAccess", package: "KeychainAccess")
            ]
        ),
// このModule内でUnitTestが必要ならば下記をコメントインしてUnitTestを記載する
//        .testTarget(
//            name: "CharacteristicStyleSwiftUIExampleTests",
//            dependencies: ["CharacteristicStyleSwiftUIExample"]
//        ),
    ]
)
