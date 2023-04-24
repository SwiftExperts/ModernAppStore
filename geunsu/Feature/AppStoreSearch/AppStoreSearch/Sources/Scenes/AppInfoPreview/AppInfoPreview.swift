//
//  AppInfoPreview.swift
//  AppStoreSearch
//
//  Created by geunsu kim on 2023/04/24.
//  Copyright © 2023 com.devkimmy. All rights reserved.
//

import SwiftUI
import Common

public protocol AppInfoPreviewRepresentable {
    
    var thumbnailUrl: URL { get }
    var name: String { get }
    var genreName: String { get }
    var averageRating: Double { get }
    var userRatingCount: Int { get }
    
}

struct AppInfoPreview: View {
    let previewItem: AppInfoPreviewRepresentable
    
    var body: some View {
        HStack {
            GSImage(url: previewItem.thumbnailUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            } placeHolder: {
                Image(systemName: "app.gift.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
            }

            VStack(alignment: .leading, spacing: 4) {
                
                Text(previewItem.name)
                    .font(.body)
                    .lineLimit(1)
                
                Text(previewItem.genreName)
                    .font(.caption)
                    .lineLimit(1)
                    .foregroundColor(.gray)

                StarRatingView(value: previewItem.averageRating)
                    .frame(width: 50, height: 10)
            }
            
            Spacer()
            
            Button("Open", action: {})
                .buttonStyle(.borderedProminent)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .padding(.horizontal)
    }
}

struct AppInfoPreview_Previews: PreviewProvider {
    
    struct DummyAppInfoPreviewItem: AppInfoPreviewRepresentable {
        var thumbnailUrl: URL {
            Bundle(for: SearchHomeViewModel.self)
                .url(forResource: "naver_logo", withExtension: "jpeg")
                .unwrapForced()
        }
        var name: String { "네이버 - NAVER" }
        var genreName: String { "검색과 콘텐츠, 쇼핑, 내도구" }
        var averageRating: Double { 2.66 }
        var userRatingCount: Int { 215000 }
    }
    
    static let imageStore = ImageStore()
    static var previews: some View {
        AppInfoPreview(previewItem: DummyAppInfoPreviewItem())
            .environmentObject(imageStore)
            .previewLayout(.fixed(width: 480, height: 70))
    }
    
}
