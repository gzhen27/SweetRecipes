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
                    if model.isLoading {
                        VStack {
                            ProgressView()
                                .controlSize(.large)
                        }
                        .frame(width: reader.size.width, height: reader.size.height)
                    } else {
                        LazyVGrid(columns: [GridItem(), GridItem()], spacing: 8) {
                            ForEach(model.meals, id: \.id) { meal in
                                NavigationLink {
                                    RecipeDetailView(id: meal.id)
                                } label: {
                                    RecipeCard(name: meal.name, imageUrl: meal.imageUrl, length: reader.size.width / 2 - 20)
                                }
                                
                            }
                        }
                        .padding(.bottom, 50)
                    }
                }
                .padding(.horizontal)
                .ignoresSafeArea(edges: .bottom)
            }
            .navigationTitle("Sweet Recipes")
            .toolbar { refreshButton }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .task {
            await model.reload()
        }
        .alert("Error", isPresented: $model.showAlert) {
            Button("OK") { model.errorMessage = "" }
        } message: {
            Text(model.errorMessage)
        }
    }
    
    var refreshButton: some View {
        Button {
            Task {
                await model.reload()
            }
        } label: {
            Image(systemName: "arrow.clockwise")
                .frame(width: 38, height: 38)
                .foregroundStyle(Color("AccentColor"))
        }
    }
}

#Preview {
    RecipesHomeView()
}
