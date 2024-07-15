//
//  APIManager.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/15/24.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    private init() {}
    
    private let scheme = "https"
    private let host = "themealdb.com"
    private let mealsPath = "/api/json/v1/1/filter.php"
    private let mealDetailPath = "/api/json/v1/1/lookup.php"
    
    func fetchMeals() async throws {
        let queryItems = [URLQueryItem(name: "c", value: "Dessert")]
        let url = buildURL(path: mealsPath, queryItems: queryItems)!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let wrapper = try decoder.decode(ResultWrapper<Meal>.self, from: data)
        print(wrapper.meals)
    }
    
    func fetchMealDetail(by id: String) async throws {
        let queryItems = [URLQueryItem(name: "i", value: id)]
        let url = buildURL(path: mealDetailPath, queryItems: queryItems)!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let wrapper = try decoder.decode(ResultWrapper<MealDetail>.self, from: data)
        print(wrapper.meals)
    }
    
    private func buildURL(path: String, queryItems: [URLQueryItem] = []) -> URL? {
        var components = URLComponents()
        
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        
        return components.url
    }
}
