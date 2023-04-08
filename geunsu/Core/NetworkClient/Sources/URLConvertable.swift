//
//  URLConvertable.swift
//  ModernAppStore
//
//  Created by geunsu.kim on 2023/04/08.
//  Copyright © 2023 com.devkimmy. All rights reserved.
//

import Foundation

public protocol URLConvertable {
    
    var baseUrl: String { get }
    var path: String { get }
    var queries: [String: String] { get }
    
}

extension URLConvertable {
    
    public func toURLString() -> String? {
        createUrlRequest()?.url?.absoluteString
    }
    
    func createUrlRequest() -> URLRequest? {
        URL(string: baseUrl + path)
            .flatMap {
                guard queries.isNotEmpty else {
                    return URLRequest(url: $0)
                }
                
                return URLRequest(url: $0.appending(queryItems: queries.map { URLQueryItem(name: $0, value: $1) }))
            }
    }
    
}
