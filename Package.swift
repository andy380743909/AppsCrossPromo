// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppsCrossPromo",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AppsCrossPromo",
            targets: ["AppsCrossPromo"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AppsCrossPromo",
            dependencies: [],
            path: "Sources",
            resources: [
                // Optional: Include assets/images/etc
                // .process("Assets")
            ],
            publicHeadersPath: "include", // 👈 For Obj-C compatibility (if using bridging headers)
            cSettings: [
                .headerSearchPath("include")
            ]
        ),
        
    ]
)
