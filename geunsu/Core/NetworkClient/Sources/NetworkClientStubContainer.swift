//
//  NetworkClientStubContainer.swift
//  NetworkClient
//
//  Created by geunsu.kim on 2023/04/08.
//  Copyright © 2023 com.devkimmy. All rights reserved.
//

import Common

public final class NetworkClientStubContainer {
    
    public enum StubProperty {
        case json([String: Any])
        case jsonData(Data)
    }
    
    static private var stubs: [String: StubProperty] = [:]
    
    public static func removeAll() {
        stubs.removeAll()
    }
    
    public static func register(urlConvertable: URLConvertable, stub: StubProperty) {
        guard let urlString = urlConvertable.toURLString() else { return }
        
        register(urlString: urlString, stub: stub)
    }
    
    public static func register(urlString: String, stub: StubProperty) {
        stubs[urlString] = stub
    }
    
    static func resolve(urlConvertable: URLConvertable) -> Data? {
        guard
            let urlString = urlConvertable.toURLString(),
            let property = stubs[urlString]
        else { return nil }
        
        switch property {
        case .json(let jsonObject):
            return (try? JSONSerialization.data(withJSONObject: jsonObject)).unwrapForced()
        case .jsonData(let data):
            return data
        }
    }
    
}
