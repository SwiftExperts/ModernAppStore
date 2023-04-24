//
//  SearchAPIWorker.swift
//  AppStoreSearch
//
//  Created by geunsu kim on 2023/04/23.
//  Copyright © 2023 com.devkimmy. All rights reserved.
//

import Foundation
import NetworkClient

protocol ISearchAPIWorker {
    func search(_ term: String) async throws -> API.Response.SearchResult
}

extension ISearchAPIWorker {
    
    func search(_ term: String) async throws -> API.Response.SearchResult {
        try await NetworkClient<API.Request.AppStoreSearch, API.Response.SearchResult>(
            .init(term: term)
        ).request()
    }
    
}

struct SearchAPIWorker: ISearchAPIWorker {}
