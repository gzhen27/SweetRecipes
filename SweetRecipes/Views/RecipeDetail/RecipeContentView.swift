//
//  RecipeContentView.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/18/24.
//

import SwiftUI

struct RecipeContentView: View {
    @State private var cateogry: DetailCategory = .instruction
    let mealDetail: MealDetail
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text(mealDetail.name)
                    .font(.title2)
                    .bold()
                Picker("", selection: $cateogry) {
                    Text("Instructions").tag(DetailCategory.instruction)
                    Text("Ingredients").tag(DetailCategory.ingredient)
                }
                .pickerStyle(.segmented)
                .padding(.vertical)
            }
            .padding(.horizontal)
            ScrollViewReader { proxy in
                ScrollView(showsIndicators: false) {
                    switch cateogry {
                    case .instruction:
                        InstructionsView(instructions: mealDetail.instructions, scrollViewProxy: proxy)
                    case .ingredient:
                        IngredientsView(ingredients: mealDetail.ingredients, scrollViewProxy: proxy)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.top, 20)
        .padding(.bottom, 40)
    }
}

#Preview {
    RecipeContentView(mealDetail: .previewData)
}
