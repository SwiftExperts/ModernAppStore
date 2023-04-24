//
//  API+AppStore.swift
//  AppStoreSearch
//
//  Created by geunsu kim on 2023/04/23.
//  Copyright © 2023 com.devkimmy. All rights reserved.
//

import NetworkClient

public extension API.Request {
    
    struct AppStoreSearch: URLConvertable {
        public let baseUrl = "https://itunes.apple.com"
        public let path = "/search"
        public var queries: [String : String]
        
        public init(term: String) {
            self.queries = [
                "entity" : "software",
                "country" : "kr",
                "limit" : "10",
                "term" : term
            ]
        }
    }
    
}

public extension API.Response {
    
    struct SearchResult: Codable, Equatable {
        public let resultCount: Int
        public let results: [Item]
        
        public struct Item: Codable, Equatable {
            public let artistId: Int?
            public let artistName: String?
            public let artistViewUrl: URL?
            public let artworkUrl60: URL?
            public let artworkUrl100: URL?
            public let artworkUrl512: URL?
            public let averageUserRating: Double?
            public let collectionCensoredName: String?
            public let collectionExplicitness: String?
            public let collectionId: Int?
            public let collectionName: String?
            public let collectionPrice: Double?
            public let collectionType: String?
            public let collectionViewUrl: URL?
            public let contentAdvisoryRating: String?
            public let country: String?
            public let currency: String?
            public let description: String?
            public let features: [String]?
            public let formattedPrice: String?
            public let genreIds: [String]?
            public let genres: [String]?
            public let ipadScreenshotUrls: [URL]?
            public let isGameCenterEnabled: Bool?
            public let isVppDeviceBasedLicensingEnabled: Bool?
            public let kind: String?
            public let languageCodesISO2A: [String]?
            public let minimumOsVersion: String?
            public let price: Double?
            public let primaryGenreId: Int?
            public let primaryGenreName: String?
            public let releaseDate: String?
            public let screenshotUrls: [URL]?
            public let sellerName: String?
            public let sellerUrl: URL?
            public let supportedDevices: [String]?
            public let trackCensoredName: String?
            public let trackContentRating: String?
            public let trackId: Int?
            public let trackName: String?
            public let trackViewUrl: URL?
            public let userRatingCount: Int
            public let userRatingCountForCurrentVersion: Int?
            public let version: String?
            public let wrapperType: String?
        }
    }
    
}

extension API.Response.SearchResult.Item: AppInfoPreviewRepresentable {
    public var thumbnailUrl: URL { artworkUrl60.unwrapForced() }
    public var name: String { trackName.unwrapForced() }
    public var genreName: String { primaryGenreName.unwrapForced() }
    public var averageRating: Double { averageUserRating.unwrapForced() }
}
