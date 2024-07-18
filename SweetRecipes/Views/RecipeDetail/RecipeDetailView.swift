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
    
    var swipeRight: some Gesture {
        DragGesture()
            .onEnded { value in
                if value.translation.width > 0 && value.translation.height > -20 && value.translation.height < 20 {
                    dismiss()
                }
            }
    }
    
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
                                .clipShape(Rectangle())
                                .shadow(color: Color("AccentColor").opacity(0.5), radius: 20)
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
                                .clipShape(Rectangle())
                            }
                            ScrollView(showsIndicators: false) {
                                VStack(alignment: .leading, spacing: 16) {
                                    Text(mealDetail.name)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Text(mealDetail.instructions.trimmingCharacters(in: .whitespacesAndNewlines))
                                    HStack(alignment: .center) {
                                        Text("Ingredients")
                                            .fontWeight(.bold)
                                        Spacer()
                                        Text("\(mealDetail.ingredients.count) items")
                                            .opacity(0.5)
                                    }
                                    .padding(.vertical)
                                    Divider()
                                    ForEach(mealDetail.ingredients) { ingredient in
                                        HStack {
                                            Text(ingredient.ingredient)
                                            Spacer()
                                            Text(ingredient.measure)
                                        }
                                        Divider()
                                    }
                                    .padding(.horizontal)
                                }
                                .padding(.vertical, 40)
                            }
                            .padding(.horizontal)
                        }
                    }
                    VStack {
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                ZStack {
                                    Circle()
                                        .frame(width: 38, height: 38)
                                        .foregroundStyle(Color("ButtonBackground"))
                                        .opacity(0.6)
                                    Text("X")
                                        .foregroundStyle(Color("ButtonContent"))
                                }
                                .padding(.leading, 16)
                                .padding(.top, 40)
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
        .onTapGesture(count: 2, perform: {
            dismiss()
        })
        .gesture(swipeRight)
        .alert("Error", isPresented: $model.showAlert) {
            Button("OK") {
                model.errorMessage = ""
                dismiss()
            }
        } message: {
            Text(model.errorMessage)
        }
        .task {
            await model.reload(by: id)
        }
    }
}

#Preview {
    //TODO: refine the preview data?
    RecipeDetailView(id: [Meal].previewData[0].id)
}
