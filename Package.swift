// swift-tools-version: 5.9

import PackageDescription
import AppleProductTypes

let package: Package = .init(
	name: "Jubilant System",
	platforms: [.iOS("17.0")],
	products: [
		.iOSApplication(
			name: "Jubilant System",
			targets: ["AppModule"],
			displayVersion: "1.0",
			bundleVersion: "1",
			appIcon: .asset("AppIcon"),
			accentColor: .presetColor(.red),
			supportedDeviceFamilies: [.pad, .phone],
			supportedInterfaceOrientations: [
				.portrait, .landscapeRight, .landscapeLeft, .portraitUpsideDown(.when(deviceFamilies: [.pad]))
			]
		)
	],
	targets: [
		.executableTarget(
			name: "AppModule",
			path: ".",
			swiftSettings: [
				.enableUpcomingFeature("BareSlashRegexLiterals")
			]
		)
	]
)
