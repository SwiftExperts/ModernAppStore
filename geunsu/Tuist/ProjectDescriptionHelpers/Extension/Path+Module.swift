//
//  Path+Module.swift
//  ProjectDescriptionHelpers
//
//  Created by geunsu.kim on 2023/04/08.
//

import ProjectDescription

extension Path {
    static let core: Self = .relativeToRoot("Core/")
    static func feature(_ name: String) -> Self {
        .relativeToRoot("Feature/\(name)")
    }
}
