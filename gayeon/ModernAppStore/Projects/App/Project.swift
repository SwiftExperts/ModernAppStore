//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by gayeon on 2023/04/17.
//

import ProjectDescription
import ProjectDescriptionHelpers

private let projectName = "App"
private let iOSTargetVersion = "16.0"

let project = Project.app(name: projectName, platform: .iOS, iOSTargetVersion: iOSTargetVersion, dependencies: [.project(target: "Home", path: .relativeToCurrentFile("../Home"))])
