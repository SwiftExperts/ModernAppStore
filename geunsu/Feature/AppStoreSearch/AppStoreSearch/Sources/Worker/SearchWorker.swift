//
//  SearchWorker.swift
//  AppStoreSearch
//
//  Created by geunsu kim on 2023/04/23.
//  Copyright © 2023 com.devkimmy. All rights reserved.
//

import Foundation
import UIKit.UIImage

public protocol IImageStore: ObservableObject {
    func save(_ url: URL) async throws
    func image(from url: URL) async throws -> Data
}

protocol ISearchWorker {
    
    var apiWorker: ISearchAPIWorker { get }
    var imageStore: any IImageStore { get }
    func searchPreviews(_ term: String) async throws -> [AppInfoPreviewRepresentable]
    
}

extension ISearchWorker {
    
    func searchPreviews(_ term: String) async throws -> [AppInfoPreviewRepresentable] {
        
        // 1. Get result from ITunes search api.
        let items = try await apiWorker.search(term).results
        // 2. Cache required image to store
        
        return items
    }
}

enum ImageStoreError: Error {
    case savingFailure
    case loadFailure
}


public actor ImageStore: IImageStore {
    
    private var store = [URL : Data]()
    
    public init() {}
    
    public func save(_ url: URL) async throws {
        guard store[url] == nil else { return }
        
        assertionFailure("Impl saving logics")
    }
    
    public func image(from url: URL) async throws -> Data {
        print("[t] processing image with url: \(url)")
        if url.scheme == "file" {
            return try Data(contentsOf: url)
        }
        
        assertionFailure("Impl load from network -> save -> return image data")
        return Data()
    }
    
}
