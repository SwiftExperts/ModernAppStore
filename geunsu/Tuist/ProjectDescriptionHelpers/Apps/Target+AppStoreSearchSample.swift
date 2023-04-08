//
//  Target+AppStoreSearchSample.swift
//  ProjectDescriptionHelpers
//
//  Created by geunsu.kim on 2023/04/08.
//

import ProjectDescription

public extension Target.Apps {
    
    static let appstoreSearchSample: [Target] = .createTargets(
        name: "AppStoreSearchSample",
        product: .app,
        dependencies: [
            .project(target: "AppStoreSearch", path: .feature("AppStoreSearch"))
        ]
    )
}
