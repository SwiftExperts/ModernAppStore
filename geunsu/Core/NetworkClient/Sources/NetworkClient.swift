//
//  NetworkClient.swift
//  ModernAppStore
//
//  Created by geunsu.kim on 2023/04/05.
//  Copyright © 2023 com.devkimmy. All rights reserved.
//

import Foundation
import Common

public enum NetworkClientError: Error {
    case requestCreationFailed
    case badResponse
    case decodeFailure
    case stubDecodeFailure
}

public struct NetworkClient<
    NetworkRequest: URLConvertable,
    NetworkResponse: Decodable
> {
    
    private let request: NetworkRequest
    
    public init(_ request: NetworkRequest) {
        self.request = request
    }
    
    public func request() async throws -> NetworkResponse {
        guard let urlRequest = request.createUrlRequest() else {
            throw NetworkClientError.requestCreationFailed
        }
        
        if let stubData = NetworkClientStubContainer.resolve(urlConvertable: request) {
            
            do {
                return try JSONDecoder().decode(NetworkResponse.self, from: stubData)
            } catch {
                throw NetworkClientError.stubDecodeFailure
            }
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw NetworkClientError.badResponse
            }
            
            return try JSONDecoder().decode(NetworkResponse.self, from: data)
        } catch {
            print(error.localizedDescription)
            throw NetworkClientError.decodeFailure
        }
        
    }
    
}
