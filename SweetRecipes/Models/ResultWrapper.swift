//
//  ResultWrapper.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/14/24.
//

import Foundation

struct ResultWrapper<T: Codable>: Codable {
    let meals: [T]
}
