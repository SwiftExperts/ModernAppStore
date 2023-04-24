//
//  SearchHomeView.swift
//  SearchHomeView
//
//  Created by geunsu.kim on 2023/04/08.
//  Copyright © 2023 com.devkimmy. All rights reserved.
//

import SwiftUI

public struct SearchHomeView: View {
    public init() {}
    
    @StateObject private var viewModel = SearchHomeViewModel()
    
    public var body: some View {
        NavigationStack {
            Group {
                switch viewModel.viewState {
                case .home:
                    Text("Home")
                case .resultsPreview(let items):
                    ScrollView {
                        LazyVStack {
                            ForEach(items, id: \.name) { item in
                                AppInfoPreview(previewItem: item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(
                text: $viewModel.searchText,
                prompt: Text("Games, Apps, Stories and More")
            )
            .onSubmit(of: .search) {
                Task(priority: .background) { await viewModel.search() }
            }
        }
    }
}

struct SearchHomeView_Previews: PreviewProvider {
    static let imageStore = ImageStore()
    static var previews: some View {
        SearchHomeView()
            .environmentObject(imageStore)
    }
}
