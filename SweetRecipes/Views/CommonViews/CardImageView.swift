//
//  CardImageView.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/18/24.
//

import SwiftUI

struct CardImageView: View {
    let url: URL
    let widht: CGFloat
    let height: CGFloat
    let contentMode: ContentMode
    
    var body: some View {
        CachedAsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ZStack {
                    Color.gray
                        .opacity(0.2)
                    ProgressView()
                }
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
            case .failure(_):
                NoImagePlaceHolderView(width: widht, height: height)
            @unknown default:
                NoImagePlaceHolderView(width: widht, height: height)
            }
        }
        .frame(width: widht, height: height)
    }
}

#Preview {
    CardImageView(url: URL(string: MealDetail.previewData.imageUrl)!, widht: 250, height: 250, contentMode: .fit)
}
