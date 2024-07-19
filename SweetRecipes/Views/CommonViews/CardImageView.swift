//
//  CardImageView.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/18/24.
//

import SwiftUI

struct CardImageView: View {
    let imageUrl: String
    let widht: CGFloat
    let height: CGFloat
    let contentMode: ContentMode
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
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
    CardImageView(imageUrl: "invalid url", widht: 200, height: 200, contentMode: .fit)
}
