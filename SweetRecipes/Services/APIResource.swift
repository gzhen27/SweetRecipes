//
//  APIResource.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/16/24.
//

import Foundation

protocol APIResource {
    associatedtype Model: Codable
    
    var host: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}

extension APIResource {
    var url: URL? {
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = host
        components.path = path
        components.queryItems = queryItems
        
        return components.url
    }
}
