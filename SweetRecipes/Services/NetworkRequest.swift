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
        do {
            let (data, res) = try await URLSession.shared.data(from: url)
            guard let res = res as? HTTPURLResponse else { throw RequestError.serverError }
            guard res.statusCode == 200 else { throw RequestError.invalidResponseStatus }
            return try decode(data)
        } catch {
            throw RequestError.dataTaskError(error.localizedDescription)
        }
    }
}
