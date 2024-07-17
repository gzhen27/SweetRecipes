//
//  RequestError.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/16/24.
//

import Foundation

enum RequestError: Error, LocalizedError {
    case invalidURL
    case dataTaskError(String)
    case invalidResponseStatus
    case serverError
    case decodingError
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("The service we are using is out of date, we will update it as soon as possible", comment: "")
        case .dataTaskError(let message):
            return message
        case .invalidResponseStatus:
            return NSLocalizedString("Unable to get data at this moment, please try again later", comment: "")
        case .serverError:
            return NSLocalizedString("Our server has a hard time at this moment, we will fix it as soon as possible", comment: "")
        case .decodingError:
            return NSLocalizedString("The data is invalid, we will fix it as soon as possible", comment: "")
        }
    }
}
