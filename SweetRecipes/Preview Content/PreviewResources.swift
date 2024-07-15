//
//  PreviewResources.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/14/24.
//

import Foundation

extension [Meal] {
    static var previewData: [Meal] {
        guard let url = Bundle.main.url(forResource: "MealsData", withExtension: "json") else { return [] }
        guard let data = try? Data(contentsOf: url) else { return [] }
        guard let result = try? JSONDecoder().decode(ResultWrapper<Meal>.self, from: data) else { return [] }
        return result.meals
    }
}