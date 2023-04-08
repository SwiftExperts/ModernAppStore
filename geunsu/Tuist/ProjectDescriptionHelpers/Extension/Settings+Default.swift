//
//  Settings+Default.swift
//  ProjectDescriptionHelpers
//
//  Created by geunsu.kim on 2023/04/08.
//

import ProjectDescription

extension Settings {
    
    static let `default` = Settings.settings(base: [
        "GENERATE_INFOPLIST_FILE" : "YES"
    ])
    
    static let appDefault = Settings.settings(base: [
        "GENERATE_INFOPLIST_FILE" : "YES",
        "MARKETING_VERSION": "1.0.0",
        "CURRENT_PROJECT_VERSION": "1",
        "UIMainStoryboardFile": "",
        "UILaunchStoryboardName": "LaunchScreen",
        "INFOPLIST_KEY_UISupportedInterfaceOrientations_iPhone": "UIInterfaceOrientationPortrait",
        "INFOPLIST_KEY_UISupportedInterfaceOrientations_iPad": "UIInterfaceOrientationPortrait UIInterfaceOrientationPortraitUpsideDown UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight",
        "INFOPLIST_KEY_UIApplicationSceneManifest_Generation": "YES",
        "INFOPLIST_KEY_UILaunchScreen_Generation": "YES"
    ])
    
}
