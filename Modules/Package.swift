// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Modules",
            targets: ["PostDetail", "UserProfile"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Core",
            dependencies: []),
        .target(
            name: "PostDetail",
            dependencies: ["Core"]),
        .target(
            name: "UserProfile",
            dependencies: ["Core"]),
        .testTarget(name: "PostDetailTests", dependencies: ["PostDetail"])
    ]
)
