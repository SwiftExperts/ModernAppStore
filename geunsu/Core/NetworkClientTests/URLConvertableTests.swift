//
//  URLConvertableTests.swift
//  NetworkClientTests
//
//  Created by geunsu.kim on 2023/04/08.
//  Copyright © 2023 com.devkimmy. All rights reserved.
//

import XCTest
@testable import NetworkClient

struct MockURLConvertable: URLConvertable {
    static let testBaseUrl = "http://devkimmy.com"
    
    var baseUrl: String { Self.testBaseUrl }
    var path: String
    var queries: [String : String]
    
    init(urlPath: String = "", queries: [String : String] = [:]) {
        self.path = urlPath
        self.queries = queries
    }
    
}

final class URLConvertableTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test🌱👉create_request_without_path_and_queries🚀validate_url_string() throws {
        // Given, When
        let testRequest = MockURLConvertable()
        
        // Then
        let expectedURLString = MockURLConvertable.testBaseUrl
        XCTAssertEqual(testRequest.toURLString(), expectedURLString)
    }
    
    func test🌱👉create_request_with_path🚀validate_url_string() throws {
        // Given, When
        let path = "/test/home"
        let testRequest = MockURLConvertable(urlPath: path)
        
        // Then
        let expectedURLString = MockURLConvertable.testBaseUrl + path
        XCTAssertEqual(testRequest.toURLString(), expectedURLString)
    }
    
    func test🌱👉create_request_with_path_and_queries🚀validate_url_string() throws {
        // Given, When
        let path = "/test/home"
        let queries = ["country" : "netherlands"]
        let testRequest = MockURLConvertable(urlPath: path, queries: queries)
        
        // Then
        let expectedURLString = MockURLConvertable.testBaseUrl + path + "?country=netherlands"
        XCTAssertEqual(testRequest.toURLString(), expectedURLString)
    }

}
