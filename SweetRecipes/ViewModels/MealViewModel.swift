//
//  MealViewModel.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/16/24.
//

import Foundation

class MealViewModel: ObservableObject {
    @Published private(set) var meals: [Meal] = []
    @Published private(set) var isLoading: Bool = false
    
    @MainActor
    func fetchMeals(by category: String? = nil) async throws {
        guard !isLoading else { return }
        defer { isLoading = false }

        isLoading = true
        let resource = MealsResource(category: category)
        let request = APIRequest(resource: resource)
        meals = try await request.excute()
    }
    
}
