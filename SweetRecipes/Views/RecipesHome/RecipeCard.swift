//
//  RecipeCard.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/18/24.
//

import SwiftUI

struct RecipeCard: View {
    let name: String
    let imageUrl: String
    let length: CGFloat
    
    let contentHeight:CGFloat = 50
    
    var body: some View {
        VStack(spacing: 2) {
            if let url = URL(string: imageUrl) {
                CardImageView(url: url, widht: length, height: length, contentMode: .fit)
            } else {
                NoImagePlaceHolderView(width: length, height: length)
            }
            CardContentView(name: name, width: length, height: contentHeight)
        }
        .frame(width: length, height: length + contentHeight)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    RecipeCard(name: "Recipe Name", imageUrl: "", length: 200)
}
