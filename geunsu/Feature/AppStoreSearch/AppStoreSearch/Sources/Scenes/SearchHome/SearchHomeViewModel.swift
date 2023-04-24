//
//  SearchHomeViewModel.swift
//  AppStoreSearch
//
//  Created by geunsu kim on 2023/04/25.
//  Copyright © 2023 com.devkimmy. All rights reserved.
//

import Foundation

final class SearchHomeViewModel: ObservableObject {
    
    enum ViewState {
        case home
        case resultsPreview([AppInfoPreviewRepresentable])
    }
    
    @Published var searchText: String = ""
    @Published var viewState: ViewState = .home
    
    private let apiWorker: ISearchAPIWorker = SearchAPIWorker()
    
    func search() async {
        do {
            let searchResult = try await apiWorker.search(searchText)
            await MainActor.run {
                viewState = .resultsPreview(searchResult.results)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
