//
//  MealViewModel.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/16/24.
//

import Foundation

class MealViewModel: ObservableObject {
    @Published private(set) var meals: [Meal] = []
    @Published private(set) var isLoading = false
    @Published var showAlert = false
    var errorMessage = ""
    
    //MARK: - Async functions
    @MainActor
    func reload() async {
        if meals.isEmpty {
            await fetch()
        }
    }
    
    //MARK: - Helper functions
    func sanitize(_ meals: [Meal]) -> [Meal] {
        guard !meals.isEmpty else { return [] }
        
        return meals
            .filter { $0.idMeal != nil && $0.strMeal != nil && !$0.id.isEmpty && !$0.name.isEmpty}
            .sorted { $0.name < $1.name }
    }
    
    //MARK: - Private functions
    @MainActor
    private func fetch(by category: String? = nil) async {
        guard !isLoading else { return }

        isLoading = true
        let resource = MealsResource(category: category)
        let request = APIRequest(resource: resource)
        Task {
            do {
                let mealsResult = try await request.excute()
                meals = sanitize(mealsResult)
                isLoading = false
            } catch let error as RequestError {
                isLoading = false
                showAlert = true
                errorMessage = error.localizedDescription
            } catch {
                isLoading = false
                showAlert = true
                errorMessage = "An unknown error has occurred."
            }
        }
    }
}
