//
//  NetworkError.swift
//  PetAdoption
//
//  Created by Ahmed Amin on 07/01/2024.
//

import Foundation

enum NetworkError: LocalizedError {
    
    case invalidServerResponse
    case invalidURL
    
    var errorDescription: String? {
        switch self {
        case .invalidServerResponse:
            return "The server returned an invalid response."
        case .invalidURL:
            return "URL string is malformed."
        }
    }
}
