//
//  ModernAppStoreApp.swift
//  ModernAppStore
//
//  Created by geunsu.kim on 2023/04/08.
//

import SwiftUI
import AppStoreSearch

@main
struct ModernAppStoreApp: App {
    @StateObject var imageStore = ImageStore()
    var body: some Scene {
        WindowGroup {
            HomeContainerView()
                .environmentObject(imageStore)
        }
    }
}
