//
//  MealViewModel.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/16/24.
//

import Foundation

@MainActor
class MealViewModel: ObservableObject {
    @Published private(set) var meals: [Meal] = []
    @Published private(set) var isLoading = false
    @Published var showAlert = false
    var errorMessage = ""
    
    private func fetchMeals(by category: String? = nil) async {
        guard !isLoading else { return }
        defer { isLoading = false }

        isLoading = true
        let resource = MealsResource(category: category)
        let request = APIRequest(resource: resource)
        Task {
            do {
                let mealsResult = try await request.excute()
                meals = mealsResult
                    .filter { $0.idMeal != nil && $0.strMeal != nil && !$0.id.isEmpty && !$0.name.isEmpty}
                    .sorted { $0.name < $1.name }
            } catch let error as RequestError {
                showAlert = true
                errorMessage = error.localizedDescription
            } catch {
                showAlert = true
                errorMessage = "An unknown error has occurred."
            }
        }
    }
    
    func refresh() async {
        if meals.isEmpty {
            await fetchMeals()
        }
    }
}
