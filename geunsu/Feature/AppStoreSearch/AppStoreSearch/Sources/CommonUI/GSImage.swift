//
//  GSImage.swift
//  AppStoreSearch
//
//  Created by geunsu kim on 2023/04/24.
//  Copyright © 2023 com.devkimmy. All rights reserved.
//

import SwiftUI

/// ImageView from url
/// - Warning: IImageStore must be injected.
public struct GSImage<I: View, P: View>: View {
    
    let url: URL?
    var placeholder: () -> P
    @ViewBuilder var imageBuilder: (Image) -> I
    
    @EnvironmentObject private var imageStore: ImageStore
    @State private var preparedImage: Image? = nil
    
    public init(
        url: URL?,
        @ViewBuilder imagebuilder: @escaping (Image) -> I,
        placeHolder: @escaping () -> P = { EmptyView() }
    ) {
        self.url = url
        self.imageBuilder = imagebuilder
        self.placeholder = placeHolder
    }
    
    public var body: some View {
        Group {
            if let preparedImage { imageBuilder(preparedImage) }
            else { placeholder() }
        }
        .task {
            guard let url else { return }
            preparedImage = (try? await imageStore.image(from: url))
                .flatMap(UIImage.init(data:))
                .flatMap(Image.init(uiImage:))
        }
    }
    
}
