//
//  IngredientsView.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/18/24.
//

import SwiftUI

struct IngredientsView: View {
    let ingredients: [Ingredient]
    let scrollViewProxy: ScrollViewProxy
    
    var body: some View {
        VStack {
            HStack(alignment: .lastTextBaseline) {
                Text("Ingredients")
                    .fontWeight(.bold)
                    .id(0)
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
            .padding(.top, 4)
        }
        .onAppear(perform: {
            scrollViewProxy.scrollTo(0)
        })
    }
}

#Preview {
    ScrollViewReader { proxy in
        IngredientsView(ingredients: MealDetail.previewData.ingredients, scrollViewProxy: proxy)
    }
}
