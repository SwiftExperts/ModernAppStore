//
//  HomeContainerView.swift
//  ModernAppStore
//
//  Created by geunsu.kim on 2023/04/08.
//  Copyright © 2023 com.devkimmy. All rights reserved.
//

import SwiftUI
import AppStoreSearch
import AppStoreFeed

enum HomeSection: Hashable {
    case feed, search
}

struct HomeContainerView: View {
    
    @State var section: HomeSection = .feed
    
    var body: some View {
        TabView(selection: $section) {
            AppStoreFeedView()
                .tabItem {
                    Image(systemName: "square.stack.3d.up.fill")
                    Text("앱")
                }
                .tag(HomeSection.feed)
            SearchHomeView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }
                .tag(HomeSection.search)
        }
    }
}

struct HomeContainerView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContainerView()
    }
}
