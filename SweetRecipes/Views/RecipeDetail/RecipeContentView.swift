//
//  RecipeContentView.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/18/24.
//

import SwiftUI

struct RecipeContentView: View {
    let mealDetail: MealDetail
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                Text(mealDetail.name)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(mealDetail.instructions)
                IngredientsView(ingredients: mealDetail.ingredients)
            }
            .padding(.vertical, 40)
        }
        .padding(.horizontal)
    }
}

#Preview {
    RecipeContentView(mealDetail: .previewData)
}
