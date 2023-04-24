//
//  StarRatingView.swift
//  AppStoreSearch
//
//  Created by geunsu kim on 2023/04/24.
//  Copyright © 2023 com.devkimmy. All rights reserved.
//

import SwiftUI

struct StarRatingView: View {
    var value: Double
    var stars: Int = 5
    
    init(value: Double) {
        self.init(value: value, stars: 5)
    }
    
    init(value: Double, stars: Int) {
        self.value = min(value, Double(stars))
        self.stars = stars
    }
    
    var body: some View {
        GeometryReader { gr in
            let ratingWidth = gr.size.width * value / Double(stars)
            let starWidth = gr.size.width / Double(stars)
            
            ZStack {
                HStack(spacing:0) {
                    Rectangle()
                        .fill(.gray)
                        .frame(width: ratingWidth)
                    Rectangle()
                        .fill(.clear)
                }
                .mask {
                    HStack(spacing:0) {
                        ForEach(1...stars, id:\.self) { _ in
                            Star(corners: 5, smoothness: 0.4)
                                .fill(Color.gray, style: FillStyle(eoFill: true, antialiased: true))
                                .frame(width: starWidth, height: gr.size.height, alignment: .center)
                        }
                    }
                }
                
                HStack(spacing:0) {
                    ForEach(1...stars, id:\.self) { _ in
                        Star(corners: 5, smoothness: 0.4)
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(width: starWidth, height: gr.size.height, alignment: .center)
                    }
                }
            }
        }
    }
}

struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingView(value: 2.5)
            .previewLayout(.fixed(width: 480, height: 100))
    }
}
