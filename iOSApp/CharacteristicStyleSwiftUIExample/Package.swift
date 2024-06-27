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
        .library(name: "ViewObject", targets: ["ViewObject"]),
        .library(name: "ViewStateProvider", targets: ["ViewStateProvider"])
    ],
    dependencies: [
        .package(url: "https://github.com/evgenyneu/Cosmos", branch: "master"),
        .package(url: "https://github.com/kean/Nuke", from: "12.7.3")
    ],
    targets: [
        .target(
            name: "AppFeature",
            dependencies: [
                "Extension",
                "Screen"
            ]
        ),
        .target(
            name: "Components",
            dependencies: [
                .product(name: "Cosmos", package: "Cosmos")
            ]
        ),
        .target(
            name: "Domain",
            dependencies: [
                "Entity",
                "Infrastructure"
            ]
        ),
        .target(name: "Entity"),
        .target(name: "Extension"),
        .target(
            name: "Infrastructure",
            dependencies: [
                "Entity"
            ]
        ),
        .target(
            name: "Screen",
            dependencies: [
                "Components",
                "Extension",
                "ViewObject",
                "ViewStateProvider",
            ]
        ),
        .target(
            name: "ViewObject",
            dependencies: [
                "Entity",
            ]
        ),
        .target(
            name: "ViewStateProvider",
            dependencies: [
                "Domain",
                "Entity",
                "Infrastructure",
                "ViewObject",
            ]
        ),
        .testTarget(
            name: "ViewStateProviderTests",
            dependencies: [
                "ViewStateProvider",
            ]
        ),
    ]
)
