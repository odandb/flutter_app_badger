// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "flutter_app_badger",
    platforms: [
        .iOS("14.0"),
    ],
    products: [
        .library(name: "flutter-app-badger", targets: ["flutter_app_badger"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "flutter_app_badger",
            dependencies: [],
            cSettings: [
                .headerSearchPath("include/flutter_app_badger"),
            ]
        ),
    ]
)
