//
//  Meal.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/14/24.
//

import Foundation

struct Meal: Codable {
    // Since the types info are missing from the API docs, we will use all optionals to avoid any null values.
    // Theoretically, the idMeal and strMeal values should not be null, but we should not fully reply on the APIs, and ahould handle all edge cases on our ends.
    let idMeal: String?
    let strMeal: String?
    let strMealThumb: String?
    
    var id: String {
        idMeal != nil ? idMeal!.trimmingCharacters(in: .whitespaces) : "unknown"
    }
    
    var name: String {
        strMeal != nil ? strMeal!.trimmingCharacters(in: .whitespaces) : "unknown"
    }
    
    var imageUrl: String {
        strMealThumb != nil ? strMealThumb!.trimmingCharacters(in: .whitespaces) : ""
    }
}
