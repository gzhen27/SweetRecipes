//
//  IngredientsView.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/18/24.
//

import SwiftUI

struct IngredientsView: View {
    let ingredients: [Ingredient]
    
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            Text("Ingredients")
                .fontWeight(.bold)
            Spacer()
            Text("\(ingredients.count) items")
                .font(.callout)
                .opacity(0.5)
        }
        .padding(.top)
        Divider()
        ForEach(ingredients) { ingredient in
            HStack {
                Text(ingredient.ingredient)
                Spacer()
                Text(ingredient.measure)
            }
            Divider()
        }
        .padding(.horizontal)
    }
}

#Preview {
    IngredientsView(ingredients: MealDetail.previewData.ingredients)
}
