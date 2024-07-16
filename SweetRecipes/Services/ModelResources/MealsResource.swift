//
//  MealsResource.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/16/24.
//

import Foundation

struct MealsResource: APIResource {
    typealias Model = Meal
    
    let category: String?
    
    let host = "themealdb.com"
    let path =  "/api/json/v1/1/filter.php"
    let defaultCategory = "Dessert"
    
    var queryItems: [URLQueryItem]? {
        [URLQueryItem(name: "c", value: category == nil ? defaultCategory : category)]
    }
}
