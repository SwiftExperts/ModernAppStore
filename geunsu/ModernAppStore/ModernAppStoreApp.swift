//
//  ModernAppStoreApp.swift
//  ModernAppStore
//
//  Created by geunsu.kim on 2023/04/04.
//

import SwiftUI
import Core
import NetworkClient

@main
struct ModernAppStoreApp: App {
    let core = Core()
    let networkClient = NetworkClient()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
