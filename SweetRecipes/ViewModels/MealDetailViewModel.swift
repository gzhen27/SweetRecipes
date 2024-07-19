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
    
    //MARK: - Async functions
    func reload(by id: String) async {
        await fetch(by: id)
    }
    
    //MARK: - Private functions
    @MainActor
    private func fetch(by id: String) async {
        guard !isLoading else { return }
        
        isLoading = true
        let resource = MealDetailResource(id: id)
        let request = APIRequest(resource:  resource)
        
        Task {
            do {
                let result = try await request.excute()
                mealDetail = result[0]
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
