// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VendingMachinePackage",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "VendingMachineCore",
            targets: ["VendingMachineCore"]),
        .library(
            name: "VendingMachineUI",
            targets: ["VendingMachineUI"]),
        .library(
            name: "ManagerCore",
            targets: ["ManagerCore"]),
        .library(
            name: "ManagerUI",
            targets: ["ManagerUI"]),
        .library(
            name: "CustomerCore",
            targets: ["CustomerCore"]),
        .library(
            name: "StandCore",
            targets: ["StandCore"]),
        .library(
            name: "DrinkCore",
            targets: ["DrinkCore"]),
        .library(
            name: "DataAnalyzeClient",
            targets: ["DataAnalyzeClient"]),
        .library(
            name: "DataAnalyzeClientLive",
            targets: ["DataAnalyzeClientLive"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "0.9.1"),
    ],
    targets: [
        .target(
            name: "VendingMachineCore",
            dependencies: [
                "CustomerCore",
                "ManagerCore",
                "DrinkCore",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .target(
            name: "VendingMachineUI",
            dependencies: [
                "VendingMachineCore",
                "ManagerUI",
                "CustomerUI",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .target(
            name: "ManagerCore",
            dependencies: [
                "StandCore",
                "DrinkCore",
                "DataAnalyzeClient",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .target(
            name: "ManagerUI",
            dependencies: [
                "ManagerCore",
                "DrinkCore",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .target(
            name: "CustomerCore",
            dependencies: [
                "StandCore",
                "DrinkCore",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .target(
            name: "CustomerUI",
            dependencies: [
                "CustomerCore",
                "DrinkCore",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .target(
            name: "DrinkCore",
            dependencies: []
        ),
        .target(
            name: "StandCore",
            dependencies: [
                "DrinkCore",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .target(
            name: "DataAnalyzeClient",
            dependencies: [
                "DrinkCore",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .target(
            name: "DataAnalyzeClientLive",
            dependencies: [
                "DrinkCore",
                "DataAnalyzeClient",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "StandCoreTests",
            dependencies: [
                "DrinkCore",
                "StandCore",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "CustomerCoreTests",
            dependencies: [
                "CustomerCore",
                "StandCore",
                "DrinkCore",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "ManagerCoreTests",
            dependencies: [
                "ManagerCore",
                "StandCore",
                "DrinkCore",
                "DataAnalyzeClient",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "VendingMachineCoreTests",
            dependencies: [
                "CustomerCore",
                "ManagerCore",
                "DrinkCore",
                "VendingMachineCore",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "VendingMachineUITests",
            dependencies: [
                "VendingMachineCore",
                "VendingMachineUI",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "CustomerUITests",
            dependencies: [
                "CustomerUI",
                "CustomerCore",
                "DrinkCore",
                "StandCore",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "ManagerUITests",
            dependencies: [
                "ManagerCore",
                "ManagerUI",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
    ]
)
