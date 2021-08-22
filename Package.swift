// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Earendil",
    platforms: [
//        .macOS(.v11),
        .iOS(.v14),
        .tvOS(.v14),
        .watchOS(.v7)
    ],
    products: [
        .library(name: "Earendil",
                 type: .static,
                 targets: ["Earendil"]
        )
    ],
    dependencies: [],
    targets: [
        .target(name: "Earendil",
                dependencies: [],
                resources: [.process("Resources")]
        ),
        .testTarget(name: "EarendilTests",
                    dependencies: ["Earendil"]
        )
    ]
)
