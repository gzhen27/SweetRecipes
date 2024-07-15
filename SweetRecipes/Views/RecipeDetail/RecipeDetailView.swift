//
//  RecipeDetailView.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/15/24.
//

import SwiftUI

struct RecipeDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    let meal: Meal
    //TODO: get data from API.
    let mealDetail: MealDetail = .previewData
    
    var body: some View {
        VStack {
            GeometryReader { reader in
                ZStack {
                    VStack(spacing: 0) {
                        AsyncImage(url: URL(string: mealDetail.strMealThumb)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ZStack {
                                Color.gray
                                    .opacity(0.1)
                                ProgressView()
                                    .controlSize(.large)
                            }
                        }
                        .frame(width: reader.size.width, height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        ScrollView {
                            VStack(alignment: .leading, spacing: 16) {
                                Text(mealDetail.strMeal)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text(mealDetail.strInstructions.trimmingCharacters(in: .whitespacesAndNewlines))
                                Text("Ingredients")
                                    .fontWeight(.bold)
                                ForEach(mealDetail.ingredients) { ingredient in
                                    HStack {
                                        Text(ingredient.ingredient)
                                        Spacer()
                                        Text(ingredient.measure)
                                    }
                                }
                                .padding(.horizontal)
                            }
                            .padding(.vertical)
                        }
                        .padding(.horizontal)
                    }
                    VStack {
                        HStack {
                            Image(systemName: "arrow.backward")
                                .font(.system(size: 36, weight: .light))
                                .foregroundColor(.white)
                                .padding(.leading, 16)
                                .padding(.top, 48)
                                .onTapGesture {
                                    dismiss()
                                }
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    //TODO: refine the preview data?
    RecipeDetailView(meal: [Meal].previewData[0])
}
