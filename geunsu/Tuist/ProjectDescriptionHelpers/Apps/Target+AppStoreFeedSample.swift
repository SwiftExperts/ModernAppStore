//
//  Target+AppStoreFeedSample.swift
//  ProjectDescriptionHelpers
//
//  Created by geunsu.kim on 2023/04/08.
//

import ProjectDescription

public extension Target.Apps {
    
    static let appstoreFeedSample: [Target] = .createTargets(
        name: "AppStoreFeedSample",
        product: .app,
        dependencies: [
            .project(target: "AppStoreFeed", path: .feature("AppStoreFeed"))
        ]
    )
}
