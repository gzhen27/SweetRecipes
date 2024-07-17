//
//  APIRequest.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/16/24.
//

import Foundation

class APIRequest<Resource: APIResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension APIRequest: NetworkRequest {
    func decode(_ data: Data) throws -> [Resource.Model] {
        do {
            let wrapper = try JSONDecoder().decode(ResultWrapper<Resource.Model>.self, from: data)
            return wrapper.meals
        } catch {
            throw RequestError.decodingError
        }
    }
    
    func excute() async throws -> [Resource.Model] {
        guard let url = resource.url else { throw RequestError.invalidURL }
        return try await load(url)
    }
}
