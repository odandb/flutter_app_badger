// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "flutter_app_badger",
    platforms: [
        .macOS("10.11"),
    ],
    products: [
        .library(name: "flutter-app-badger", targets: ["flutter_app_badger"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "flutter_app_badger",
            dependencies: []
        ),
    ]
)
