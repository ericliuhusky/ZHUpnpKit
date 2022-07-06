// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "ZHUpnpKit",
    products: [
        .library(
            name: "ZHUpnpKit",
            targets: ["ZHUpnpKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/bjtj/swift-upnp-tools.git", from: "0.1.13"),
    ],
    targets: [
        .target(
            name: "ZHUpnpKit",
            dependencies: [
                .product(name: "SwiftUpnpTools", package: "swift-upnp-tools")
            ]),
        .testTarget(
            name: "ZHUpnpKitTests",
            dependencies: ["ZHUpnpKit"]),
    ]
)
