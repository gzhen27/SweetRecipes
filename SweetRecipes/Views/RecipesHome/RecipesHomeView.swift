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
                        ForEach(model.meals, id: \.id) { meal in
                            NavigationLink {
                                RecipeDetailView(id: meal.id)
                            } label: {
                                VStack(spacing: 2) {
                                    if !meal.imageUrl.isEmpty {
                                        AsyncImage(url: URL(string: meal.imageUrl)) { image in
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
                                    } else {
                                        ZStack {
                                            Color.gray
                                            VStack {
                                                Text("NO")
                                                Text("Image")
                                            }
                                            .foregroundStyle(Color.black)
                                        }
                                        .opacity(0.2)
                                        .frame(width: reader.size.width / 2 - 20, height: reader.size.width / 2 - 20)
                                    }
                                    HStack() {
                                        Text(meal.name)
                                            .font(.footnote)
                                            .fontWeight(.medium)
                                            .padding(.horizontal)
                                            .frame(width: reader.size.width / 2 - 20, height: 50)
                                    }
                                    .background(Color("CardBackground"))
                                    .foregroundStyle(Color("CardContent"))
                                }
                                .frame(width: reader.size.width / 2 - 20, height: reader.size.width / 2 - 20 + 50)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            }
                            
                        }
                    }
                    .padding(.bottom, 50)
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
            .toolbar {
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
        .task {
            await model.reload()
        }
        .refreshable {
            await model.reload()
        }
    }
}

#Preview {
    RecipesHomeView()
}
