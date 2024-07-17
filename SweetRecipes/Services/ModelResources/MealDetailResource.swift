//
//  MealDetailResource.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/16/24.
//

import Foundation

struct MealDetailResource: APIResource {
    typealias Model = MealDetail
    
    let id: String
    
    let host = "themealdb.com"
    let path =  "/api/json/v1/1/lookup.php"
    
    var queryItems: [URLQueryItem]? {
        [URLQueryItem(name: "i", value: id)]
    }
}
