//
//  SearchAPIWorkerTests.swift
//  AppStoreSearch
//
//  Created by geunsu kim on 2023/04/23.
//  Copyright © 2023 com.devkimmy. All rights reserved.
//

import XCTest
import NetworkClient

@testable import AppStoreSearch

final class SearchAPIWorkerTests: XCTestCase {
    
    var sut: SearchAPIWorker!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = .init()
    }
    
    override func tearDownWithError() throws {
        NetworkClientStubContainer.removeAll()
        try super.tearDownWithError()
    }
    
    func test🌱serach_api_worker👉search🚀check_mapped_object() async throws {
        // Given
        let request = API.Request.AppStoreSearch(term: "naver")
        let dummyData = try XCTUnwrap(
            Bundle(for: SearchAPIWorkerTests.self)
                .url(forResource: "search_response", withExtension: "json")
                .flatMap { try? Data(contentsOf: $0) }
        )
        
        NetworkClientStubContainer.register(
            urlString: request.toURLString().unwrapForced(),
            stub: .jsonData(dummyData)
        )
        
        // When
        let result = try await sut.search("naver")
        
        // Then
        let expected = try XCTUnwrap(JSONDecoder().decode(API.Response.SearchResult.self, from: dummyData))
        XCTAssertEqual(result.results.map(\.artistId), expected.results.map(\.artistId))
    }
    
}
