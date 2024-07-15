//
//  RecipesHomeView.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/14/24.
//

import SwiftUI

struct RecipesHomeView: View {
    let meals: [Meal]
    
    var body: some View {
        VStack(spacing: 2) {
            AsyncImage(url: URL(string: meals[0].strMealThumb)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ZStack {
                    Color.gray
                        .opacity(0.2)
                    ProgressView()
                }
            }
            .frame(width: 200, height: 200)
            HStack() {
                Text(meals[0].strMeal)
                    .font(.footnote)
                    .bold()
                    .frame(width: 200, height: 50)
            }
            .background(Color.red.opacity(0.1))
        }
        .frame(width: 200, height: 250)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    RecipesHomeView(meals: .previewData)
}
