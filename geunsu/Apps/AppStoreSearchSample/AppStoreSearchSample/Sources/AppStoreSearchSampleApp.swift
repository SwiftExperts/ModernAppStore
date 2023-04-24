//
//  AppStoreSearchSampleApp.swift
//  AppStoreSearchSample
//
//  Created by geunsu.kim on 2023/04/08.
//

import SwiftUI
import AppStoreSearch

@main
struct AppStoreSearchSampleApp: App {
    
    @StateObject var imageStore = ImageStore()
    var body: some Scene {
        WindowGroup {
            SearchHomeView()
                .environmentObject(imageStore)
        }
    }
}
