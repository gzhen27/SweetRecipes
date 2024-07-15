//
//  MealDetail.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/14/24.
//

import Foundation

struct MealDetail: Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    let strInstructions: String
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3: String
    let strIngredient4: String
    let strIngredient5: String
    let strIngredient6: String
    let strIngredient7: String
    let strIngredient8: String
    let strIngredient9: String
    let strIngredient10: String
    let strIngredient11: String
    let strIngredient12: String
    let strIngredient13: String
    let strIngredient14: String
    let strIngredient15: String
    let strIngredient16: String
    let strIngredient17: String
    let strIngredient18: String
    let strIngredient19: String
    let strIngredient20: String
    let strMeasure1: String
    let strMeasure2: String
    let strMeasure3: String
    let strMeasure4: String
    let strMeasure5: String
    let strMeasure6: String
    let strMeasure7: String
    let strMeasure8: String
    let strMeasure9: String
    let strMeasure10: String
    let strMeasure11: String
    let strMeasure12: String
    let strMeasure13: String
    let strMeasure14: String
    let strMeasure15: String
    let strMeasure16: String
    let strMeasure17: String
    let strMeasure18: String
    let strMeasure19: String
    let strMeasure20: String
}

extension MealDetail {
    var ingredients: [Ingredient] {
        var ingredients: [Ingredient] = []
        var id = 1
        
        appendIngredient(ingredient: strIngredient1, measure: strMeasure1, ingredients: &ingredients, id: &id)
        appendIngredient(ingredient: strIngredient2, measure: strMeasure2, ingredients: &ingredients, id: &id)
        appendIngredient(ingredient: strIngredient3, measure: strMeasure3, ingredients: &ingredients, id: &id)
        appendIngredient(ingredient: strIngredient4, measure: strMeasure4, ingredients: &ingredients, id: &id)
        appendIngredient(ingredient: strIngredient5, measure: strMeasure5, ingredients: &ingredients, id: &id)
        appendIngredient(ingredient: strIngredient6, measure: strMeasure6, ingredients: &ingredients, id: &id)
        appendIngredient(ingredient: strIngredient7, measure: strMeasure7, ingredients: &ingredients, id: &id)
        appendIngredient(ingredient: strIngredient8, measure: strMeasure8, ingredients: &ingredients, id: &id)
        appendIngredient(ingredient: strIngredient9, measure: strMeasure9, ingredients: &ingredients, id: &id)
        appendIngredient(ingredient: strIngredient10, measure: strMeasure10, ingredients: &ingredients, id: &id)
        appendIngredient(ingredient: strIngredient11, measure: strMeasure11, ingredients: &ingredients, id: &id)
        appendIngredient(ingredient: strIngredient12, measure: strMeasure12, ingredients: &ingredients, id: &id)
        appendIngredient(ingredient: strIngredient13, measure: strMeasure13, ingredients: &ingredients, id: &id)
        appendIngredient(ingredient: strIngredient14, measure: strMeasure14, ingredients: &ingredients, id: &id)
        appendIngredient(ingredient: strIngredient15, measure: strMeasure15, ingredients: &ingredients, id: &id)
        appendIngredient(ingredient: strIngredient16, measure: strMeasure16, ingredients: &ingredients, id: &id)
        appendIngredient(ingredient: strIngredient17, measure: strMeasure17, ingredients: &ingredients, id: &id)
        appendIngredient(ingredient: strIngredient18, measure: strMeasure18, ingredients: &ingredients, id: &id)
        appendIngredient(ingredient: strIngredient19, measure: strMeasure19, ingredients: &ingredients, id: &id)
        appendIngredient(ingredient: strIngredient20, measure: strMeasure20, ingredients: &ingredients, id: &id)
        
        return ingredients
    }
    
    private func appendIngredient(ingredient: String, measure: String, ingredients: inout [Ingredient], id: inout Int) {
        let trimmedIngredientText = ingredient.trimmingCharacters(in: .whitespaces)
        let trimmedMeasureText = measure.trimmingCharacters(in: .whitespaces)
        if (!trimmedIngredientText.isEmpty && !trimmedMeasureText.isEmpty) {
            ingredients.append(Ingredient(id: id, ingredient: trimmedIngredientText, measure: trimmedMeasureText))
            id += 1
        }
    }
}
