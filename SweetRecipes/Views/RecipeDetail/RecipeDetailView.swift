//
//  RecipeDetailView.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/15/24.
//

import SwiftUI

struct RecipeDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var model = MealDetailViewModel()
    
    let id: String
    
    var body: some View {
        VStack {
            GeometryReader { reader in
                ZStack {
                    if let mealDetail = model.mealDetail {
                        VStack(spacing: 0) {
                            if !mealDetail.imageUrl.isEmpty {
                                AsyncImage(url: URL(string: mealDetail.imageUrl)) { image in
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
                                .frame(width: reader.size.width, height: 250)
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                            }
                            ScrollView(showsIndicators: false) {
                                VStack(alignment: .leading, spacing: 16) {
                                    Text(mealDetail.name)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Text(mealDetail.instructions.trimmingCharacters(in: .whitespacesAndNewlines))
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
                                .padding(.bottom, 50)
                            }
                            .padding(.horizontal)
                        }
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
        .alert("Error", isPresented: $model.showAlert) {
            Button("OK") {
                model.errorMessage = ""
                dismiss()
            }
        } message: {
            Text(model.errorMessage)
        }
        .task {
            await model.fetch(by: id)
        }
    }
}

#Preview {
    //TODO: refine the preview data?
    RecipeDetailView(id: [Meal].previewData[0].id)
}
