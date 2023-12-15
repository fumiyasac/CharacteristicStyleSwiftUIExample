// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CharacteristicStyleSwiftUIExample",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "AppFeature", targets: ["AppFeature"]),
        .library(name: "Components", targets: ["Components"]),
        .library(name: "Domain", targets: ["Domain"]),
        .library(name: "Entity", targets: ["Entity"]),
        .library(name: "Extension", targets: ["Extension"]),
        .library(name: "Infrastructure", targets: ["Infrastructure"]),
        .library(name: "Screen", targets: ["Screen"]),
    ],
    dependencies: [
        .package(url: "https://github.com/evgenyneu/Cosmos", branch: "master"),
        .package(url: "https://github.com/kean/Nuke", from: "12.1.6"),
        .package(url: "https://github.com/amirdew/CollectionViewPagingLayout", from: "1.1.0"),
        .package(url: "https://github.com/simibac/ConfettiSwiftUI.git", from: "1.1.0"),
        .package(url: "https://github.com/sunshinejr/SwiftyUserDefaults.git", from: "5.3.0")
    ],
    targets: [
        .target(name: "AppFeature"),
        .target(
            name: "Components",
            dependencies: [
                .product(name: "Cosmos", package: "Cosmos"),
                .product(name: "CollectionViewPagingLayout", package: "CollectionViewPagingLayout"),
                .product(name: "ConfettiSwiftUI", package: "ConfettiSwiftUI")
            ]
        ),
        .target(name: "Domain"),
        .target(name: "Entity"),
        .target(name: "Extension"),
        .target(
            name: "Infrastructure",
            dependencies: [
                "Entity",
                .product(name: "SwiftyUserDefaults", package: "SwiftyUserDefaults")
            ]
        ),
        .target(name: "Screen"),
// このModule内でUnitTestが必要ならば下記をコメントインしてUnitTestを記載する
//        .testTarget(
//            name: "CharacteristicStyleSwiftUIExampleTests",
//            dependencies: ["CharacteristicStyleSwiftUIExample"]
//        ),
    ]
)
