//
//  Ingredient.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/15/24.
//

import Foundation

struct Ingredient: Identifiable {
    let id = UUID()
    let ingredient: String
    let measure: String
}
