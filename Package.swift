// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWSwiftMobileVLC",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "WWSwiftMobileVLC", targets: ["WWSwiftMobileVLC"]),
    ],
    targets: [
        .target(name: "WWSwiftMobileVLC", dependencies: ["MobileVLCKit"], resources: [.copy("Privacy")]),
        .binaryTarget(name: "MobileVLCKit", path: "MobileVLCKit.xcframework")
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
