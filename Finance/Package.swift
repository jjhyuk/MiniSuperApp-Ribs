// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Finance",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AddPaymentMethod",
            targets: ["AddPaymentMethod"]
        ),
        .library(
            name: "AddPaymentMethodImp",
            targets: ["AddPaymentMethodImp"]
        ),
        .library(
            name: "FinanceEntity",
            targets: ["FinanceEntity"]
        ),
        .library(
            name: "FinanceRepository",
            targets: ["FinanceRepository"]
        ),
        .library(
            name: "Topup",
            targets: ["Topup"]
        ),
        .library(
            name: "TopupImp",
            targets: ["TopupImp"]
        ),
        .library(
            name: "FinanceHome",
            targets: ["FinanceHome"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/DevYeom/ModernRIBs.git", .exact("1.0.1")),
        .package(url: "https://github.com/CombineCommunity/CombineExt.git", .exact("1.0.0")),
        .package(path: "../Platform")
    ],
    targets: [
        .target(
            name: "AddPaymentMethod",
            dependencies: [
                "ModernRIBs",
                "FinanceEntity",
                .product(name: "RibsUtil", package: "Platform"),
            ]
        ),
        .target(
            name: "AddPaymentMethodImp",
            dependencies: [
                "ModernRIBs",
                "CombineExt",
                "FinanceEntity",
                "FinanceRepository",
                .product(name: "RibsUtil", package: "Platform"),
                .product(name: "SuperUI", package: "Platform"),
            ]
        ),
        .target(
            name: "FinanceEntity",
            dependencies: [
            ]
        ),
        .target(
            name: "FinanceRepository",
            dependencies: [
                "FinanceEntity",
                .product(name: "CombineUtil", package: "Platform")
            ]
        ),
        .target(
            name: "Topup",
            dependencies: [
                "ModernRIBs",
            ]
        ),
        .target(
            name: "TopupImp",
            dependencies: [
                "ModernRIBs",
                "Topup",
                "CombineExt",
                "FinanceEntity",
                "FinanceRepository",
                "AddPaymentMethod",
                .product(name: "RibsUtil", package: "Platform"),
                .product(name: "SuperUI", package: "Platform"),
            ]
        ),
        .target(
            name: "FinanceHome",
            dependencies: [
                "ModernRIBs",
                "CombineExt",
                "FinanceEntity",
                "FinanceRepository",
                "Topup",
                "AddPaymentMethod",
                .product(name: "RibsUtil", package: "Platform"),
                .product(name: "SuperUI", package: "Platform"),
            ]
        ),
    ]
)
