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
                    if model.isLoading {
                        VStack {
                            ProgressView()
                                .controlSize(.large)
                        }
                        .frame(width: reader.size.width, height: reader.size.height)
                        .padding()
                    } else {
                        if let mealDetail = model.mealDetail {
                            VStack(spacing: 0) {
                                if let url = URL(string: mealDetail.imageUrl) {
                                    CardImageView(url: url, widht: reader.size.width, height: 250, contentMode: .fill)
                                    .clipShape(Rectangle())
                                    .shadow(color: Color("AccentColor").opacity(0.2), radius: 20)
                                } else {
                                    NoImagePlaceHolderView(width: reader.size.width, height: 250)
                                        .clipShape(Rectangle())
                                }
                                RecipeContentView(mealDetail: mealDetail)
                            }
                        }
                    }
                    closeButton
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .gesture(swipeRight)
        .onTapGesture(count: 2, perform: {
            dismiss()
        })
        .task {
            await model.reload(by: id)
        }
        .alert("Error", isPresented: $model.showAlert) {
            Button("OK") {
                model.errorMessage = ""
                dismiss()
            }
        } message: {
            Text(model.errorMessage)
        }
    }
    
    var closeButton: some View {
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
    
    var swipeRight: some Gesture {
        DragGesture()
            .onEnded { value in
                if value.translation.width > 0 && value.translation.height > -20 && value.translation.height < 20 {
                    dismiss()
                }
            }
    }
}

#Preview {
    RecipeDetailView(id: MealDetail.previewData.id)
}
