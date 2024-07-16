//
//  NetworkRequest.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/16/24.
//

import Foundation

protocol NetworkRequest {
    associatedtype Model
    
    func decode(_ data: Data) throws -> Model
    func excute() async throws -> Model
}

extension NetworkRequest {
    func load(_ url: URL) async throws -> Model {
        //TODO: handle errors 
        let (data, _) = try await URLSession.shared.data(from: url)
        return try decode(data)
    }
}
