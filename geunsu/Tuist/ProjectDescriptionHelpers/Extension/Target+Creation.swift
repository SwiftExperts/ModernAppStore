//
//  Target+Creation.swift
//  ProjectDescriptionHelpers
//
//  Created by geunsu.kim on 2023/04/08.
//

import ProjectDescription

public extension Array where Element == Target {
    
    static func createTargets(
        name: String,
        product: Product = .framework,
        isPreviewEnabled: Bool = false,
        dependencies: [TargetDependency] = []
    ) -> Self {
        let resourceFiles: ResourceFileElements = .init(resources: [
            .glob(pattern: "\(name)/Resources/**"),
            isPreviewEnabled ? .glob(pattern: "\(name)/Preview Content/**") : nil
        ].compactMap { $0 })
        
        let sources = Target(
            name: name,
            platform: .iOS,
            product: product,
            bundleId: "com.devkimmy.\(name)",
            infoPlist: nil,
            sources: ["\(name)/Sources/**"],
            resources: resourceFiles,
            headers: .headers(public: "\(name)/**"),
            dependencies: dependencies,
            settings: product == .app ? .appDefault : .default
        )
        let tests = Target(
            name: "\(name)Tests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.devkimmy.\(name)Tests",
            infoPlist: nil,
            sources: ["\(name)Tests/**"],
            resources: ["\(name)Tests/Resources/**"],
            dependencies: [.target(name: name)],
            settings: .default
        )
        return [sources, tests]
    }
    
}

public extension Project {
    
    static func create(name: String, targets: [Target]) -> Project {
        .init(
            name: name,
            organizationName: "com.devkimmy",
            options: .options(disableBundleAccessors: true),
            targets: targets,
            resourceSynthesizers: []
        )
    }
    
}
