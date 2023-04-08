//
//  Target+Core.swift
//  ProjectDescriptionHelpers
//
//  Created by geunsu.kim on 2023/04/08.
//

import ProjectDescription

public extension Target {
    
    enum Core {
        
        public static var targets: [Target] {
            [common, networkClient].flatMap { $0 }
        }
        
        private static let common: [Target] = .createTargets(name: "Common")
        private static let networkClient: [Target] = .createTargets(
            name: "NetworkClient",
            dependencies: [
                .target(name: "Common")
            ]
        )
    }
    
}
