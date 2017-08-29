// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "MirrorExtensions",
  products: [.library(name: "MirrorExtensions", targets: ["MirrorExtensions"])],
  dependencies: [],
  targets: [
    .target(name: "MirrorExtensions", dependencies: []),
    .testTarget(name: "MirrorExtensionsTests", dependencies: ["MirrorExtensions"])
  ]
)
