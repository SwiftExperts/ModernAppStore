//
//  Target+AppStoreFeed.swift
//  ProjectDescriptionHelpers
//
//  Created by geunsu.kim on 2023/04/08.
//

import ProjectDescription

public extension Target.Feature {
    
    static let appstoreFeed: [Target] = .createTargets(
        name: "AppStoreFeed",
        isPreviewEnabled: true,
        dependencies: [
            .project(target: "Common", path: .core),
            .project(target: "NetworkClient", path: .core)
        ]
    )
    
}
