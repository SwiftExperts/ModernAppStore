//
//  Target+AppStoreSearch.swift
//  ProjectDescriptionHelpers
//
//  Created by geunsu.kim on 2023/04/08.
//

import ProjectDescription

public extension Target.Feature {
    
    static let appstoreSearch: [Target] = .createTargets(
        name: "AppStoreSearch",
        isPreviewEnabled: true,
        dependencies: [
            .project(target: "Common", path: .core),
            .project(target: "NetworkClient", path: .core)
        ]
    )
    
}
