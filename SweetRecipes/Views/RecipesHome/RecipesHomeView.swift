//
//  RecipesHomeView.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/14/24.
//

import SwiftUI

struct RecipesHomeView: View {
    @StateObject private var model = MealViewModel()
    
    var body: some View {
        NavigationView {
            GeometryReader { reader in
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(), GridItem()], spacing: 8) {
                        ForEach(model.meals, id: \.idMeal) { meal in
                            NavigationLink {
                                RecipeDetailView(meal: meal)
                            } label: {
                                VStack(spacing: 2) {
                                    AsyncImage(url: URL(string: meal.strMealThumb)) { image in
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
                                    .frame(width: reader.size.width / 2 - 20, height: reader.size.width / 2 - 20)
                                    HStack() {
                                        Text(meal.strMeal)
                                            .font(.footnote)
                                            .fontWeight(.medium)
                                            .padding(.horizontal)
                                            .frame(width: reader.size.width / 2 - 20, height: 50)
                                            .foregroundStyle(Color.black)
                                    }
                                    .background(Color.red.opacity(0.1))
                                }
                                .frame(width: reader.size.width / 2 - 20, height: reader.size.width / 2 - 20 + 50)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            }
                            
                        }
                    }
                }
                .padding(.horizontal)
                .ignoresSafeArea(edges: .bottom)
            }
            .navigationTitle("Sweet Recipes")
            .alert("Error", isPresented: $model.showAlert) {
                Button("OK") {
                    model.errorMessage = ""
                }
            } message: {
                Text(model.errorMessage)
            }

        }
        .task {
            await model.fetchMeals()
        }
    }
}

#Preview {
    RecipesHomeView()
}
