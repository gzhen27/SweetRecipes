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
        AsyncImage(url: URL(string: imageUrl)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: contentMode)
        } placeholder: {
            ZStack {
                Color.gray
                    .opacity(0.2)
                ProgressView()
            }
        }
        .frame(width: widht, height: height)
    }
}

#Preview {
    CardImageView(imageUrl: "invalid url", widht: 200, height: 200, contentMode: .fit)
}
