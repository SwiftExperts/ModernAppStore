//
//  Target+ModernAppStore.swift
//  ProjectDescriptionHelpers
//
//  Created by geunsu.kim on 2023/04/08.
//

import ProjectDescription

public extension Target.Apps {
    
    static let modernAppStore: [Target] = .createTargets(
        name: "ModernAppStore",
        product: .app,
        isPreviewEnabled: true,
        dependencies: [
            .project(target: "AppStoreFeed", path: .feature("AppStoreFeed")),
            .project(target: "AppStoreSearch", path: .feature("AppStoreSearch"))
        ]
    )
    
}
