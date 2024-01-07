//
//  Request.swift
//  PetAdoption
//
//  Created by Ahmed Amin on 07/01/2024.
//

import Foundation

protocol RequestProtocol {
    
    var path: String { get }
    
    var headers: [String: String] { get }
    var params: [String: Any] { get }
    
    var urlParams: [String: String?] { get }
    
    var addAuthorizationToken: Bool { get }
    
    var requestType: RequestType { get }
}

// MARK: - Default implementation

extension RequestProtocol {
    
    var host: String {
       return APIConstants.host
    }
    
    var addAuthorizationToken: Bool {
       return true
    }
    
    var headers: [String: String] {
        return [:]
    }
    
    var params: [String: Any] {
        return [:]
    }
    
    var urlParams: [String: String?] {
        return [:]
    }
    
    // MARK: - Create Request
    
    func createURLRequest(authToken: String) throws -> URLRequest {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        
        if !urlParams.isEmpty {
            components.queryItems = urlParams.map({
                URLQueryItem(name: $0, value: $1)
            })
        }
        
        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue
        
        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }
        
        if addAuthorizationToken {
            urlRequest.setValue(authToken, forHTTPHeaderField: "Authorization")
        }
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        
        return urlRequest
    }
    
}