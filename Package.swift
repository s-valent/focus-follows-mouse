// swift-tools-version: 6.0
import PackageDescription

let package = Package(
  name: "focus-follows-mouse",
  platforms: [.macOS(.v14)],
  products: [.executable(name: "focus-follows-mouse", targets: ["FocusFollowsMouse"])],
  targets: [
    .target(name: "WindowRules"),
    .target(
      name: "WindowServer",
      linkerSettings: [
        .linkedFramework("ApplicationServices"),
        .linkedFramework("Carbon"),
      ]
    ),
    .executableTarget(name: "FocusFollowsMouse", dependencies: ["WindowRules", "WindowServer"]),
    .testTarget(name: "WindowRulesTests", dependencies: ["WindowRules"]),
    .testTarget(name: "FocusFollowsMouseTests", dependencies: ["FocusFollowsMouse"]),
  ]
)
