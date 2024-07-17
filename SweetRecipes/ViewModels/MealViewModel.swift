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
    
    @MainActor
    func fetchMeals(by category: String? = nil) async {
        guard !isLoading else { return }
        defer { isLoading = false }

        isLoading = true
        let resource = MealsResource(category: category)
        let request = APIRequest(resource: resource)
        do {
            meals = try await request.excute()
        } catch let error as RequestError {
            showAlert = true
            errorMessage = error.localizedDescription
        } catch {
            showAlert = true
            errorMessage = "An unknown error has occurred."
        }
    }
    
}
