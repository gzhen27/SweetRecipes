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
        //TODO: handle errors
        let wrapper = try JSONDecoder().decode(ResultWrapper<Resource.Model>.self, from: data)
        return wrapper.meals
    }
    
    func excute() async throws -> [Resource.Model] {
        //TODO: handle errors and the optional url
        try await load(resource.url!)
    }
}
