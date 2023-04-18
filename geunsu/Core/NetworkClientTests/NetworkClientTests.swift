//
//  NetworkClientTests.swift
//  NetworkClientTests
//
//  Created by geunsu.kim on 2023/04/08.
//

import XCTest
@testable import NetworkClient

extension API.Response {
    
    struct TestResponse: Codable, Equatable {
        let intValue: Int
        let optionaIntValue: Int?
        let stringValue: String
        let stringArray: [String]
        
        init(
            intValue: Int,
            optionaIntValue: Int?,
            stringValue: String,
            stringArray: [String]
        ) {
            self.intValue = intValue
            self.optionaIntValue = optionaIntValue
            self.stringValue = stringValue
            self.stringArray = stringArray
        }
    }
    
}

final class NetworkClientTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        NetworkClientStubContainer.removeAll()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test🌱with_jsonObject👉register_and_request🚀validate_response() async throws {
        // Given
        let request = MockURLConvertable()
        let jsonObject: [String : Any] = [
            "intValue" : 1,
            "stringValue" : "test",
            "stringArray" : ["test1", "test2"]
        ]
        
        // When
        NetworkClientStubContainer.register(urlConvertable: request, stub: .json(jsonObject))
        let response = try await NetworkClient<MockURLConvertable, API.Response.TestResponse>(request).request()
        
        // Then
        let expectedResponse = API.Response.TestResponse(
            intValue: 1,
            optionaIntValue: nil,
            stringValue: "test",
            stringArray: ["test1", "test2"]
        )
        
        XCTAssertEqual(response, expectedResponse)
    }
    
    func test🌱with_jsonData👉register_and_request🚀validate_response() async throws {
        // Given
        let request = MockURLConvertable()
        let jsonData = Bundle(for: NetworkClientTests.self).url(forResource: "mock_response", withExtension: "json")
            .flatMap { try? Data(contentsOf: $0) }
            .unwrapForced()
        
        // When
        NetworkClientStubContainer.register(urlConvertable: request, stub: .jsonData(jsonData))
        let response = try await NetworkClient<MockURLConvertable, API.Response.TestResponse>(request).request()
        
        // Then
        let expectedResponse = API.Response.TestResponse(
            intValue: 10,
            optionaIntValue: 100,
            stringValue: "test test",
            stringArray: ["test1", "test2"]
        )
        
        XCTAssertEqual(response, expectedResponse)
    }

}
