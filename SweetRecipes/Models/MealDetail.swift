//
//  MealDetail.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/14/24.
//

import Foundation

struct MealDetail: Codable {
    // Since the types info are missing from the API docs, we will use all optionals to avoid any null values.
    // Theoretically, the idMeal and strMeal values should not be null, but we should not fully reply on the APIs, and ahould handle all edge cases on our ends.
    let idMeal: String?
    let strMeal: String?
    let strMealThumb: String?
    let strInstructions: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    
    
    
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

extension MealDetail {
    var instructions: [String] {
        guard let strInstructions = strInstructions else { return [] }
        return strInstructions
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
    }
    
    var ingredients: [Ingredient] {
        var ingredients: [Ingredient] = []
        
        appendIngredient(ingredient: strIngredient1, measure: strMeasure1, ingredients: &ingredients)
        appendIngredient(ingredient: strIngredient2, measure: strMeasure2, ingredients: &ingredients)
        appendIngredient(ingredient: strIngredient3, measure: strMeasure3, ingredients: &ingredients)
        appendIngredient(ingredient: strIngredient4, measure: strMeasure4, ingredients: &ingredients)
        appendIngredient(ingredient: strIngredient5, measure: strMeasure5, ingredients: &ingredients)
        appendIngredient(ingredient: strIngredient6, measure: strMeasure6, ingredients: &ingredients)
        appendIngredient(ingredient: strIngredient7, measure: strMeasure7, ingredients: &ingredients)
        appendIngredient(ingredient: strIngredient8, measure: strMeasure8, ingredients: &ingredients)
        appendIngredient(ingredient: strIngredient9, measure: strMeasure9, ingredients: &ingredients)
        appendIngredient(ingredient: strIngredient10, measure: strMeasure10, ingredients: &ingredients)
        appendIngredient(ingredient: strIngredient11, measure: strMeasure11, ingredients: &ingredients)
        appendIngredient(ingredient: strIngredient12, measure: strMeasure12, ingredients: &ingredients)
        appendIngredient(ingredient: strIngredient13, measure: strMeasure13, ingredients: &ingredients)
        appendIngredient(ingredient: strIngredient14, measure: strMeasure14, ingredients: &ingredients)
        appendIngredient(ingredient: strIngredient15, measure: strMeasure15, ingredients: &ingredients)
        appendIngredient(ingredient: strIngredient16, measure: strMeasure16, ingredients: &ingredients)
        appendIngredient(ingredient: strIngredient17, measure: strMeasure17, ingredients: &ingredients)
        appendIngredient(ingredient: strIngredient18, measure: strMeasure18, ingredients: &ingredients)
        appendIngredient(ingredient: strIngredient19, measure: strMeasure19, ingredients: &ingredients)
        appendIngredient(ingredient: strIngredient20, measure: strMeasure20, ingredients: &ingredients)
        
        return ingredients
    }
    
    private func appendIngredient(ingredient: String?, measure: String?, ingredients: inout [Ingredient]) {
        guard let ingredient = ingredient, let measure = measure else { return }
        let trimmedIngredientText = ingredient.trimmingCharacters(in: .whitespaces)
        let trimmedMeasureText = measure.trimmingCharacters(in: .whitespaces)
        if (!trimmedIngredientText.isEmpty && !trimmedMeasureText.isEmpty) {
            ingredients.append(Ingredient(ingredient: trimmedIngredientText, measure: trimmedMeasureText))
        }
    }
}


enum DetailCategory {
    case instruction
    case ingredient
}
