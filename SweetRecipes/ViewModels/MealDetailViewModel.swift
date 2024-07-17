//
//  MealDetailViewModel.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/16/24.
//

import Foundation

class MealDetailViewModel: ObservableObject {
    @Published private(set) var mealDetail: MealDetail?
    @Published private(set) var isLoading = false
    @Published var showAlert = false
    var errorMessage = ""
    
    @MainActor
    func fetch(by id: String) async {
        guard !isLoading else { return }
        defer { isLoading = false }
        
        isLoading = true
        let resource = MealDetailResource(id: id)
        let request = APIRequest(resource:  resource)
        
        Task {
            do {
                let result = try await request.excute()
                mealDetail = result[0]
            } catch let error as RequestError {
                showAlert = true
                errorMessage = error.localizedDescription
            } catch {
                showAlert = true
                errorMessage = "An unknown error has occurred."
            }
        }
    }
}
