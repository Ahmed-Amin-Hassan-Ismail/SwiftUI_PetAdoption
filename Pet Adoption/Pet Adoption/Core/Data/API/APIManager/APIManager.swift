//
//  APIManager.swift
//  PetAdoption
//
//  Created by Ahmed Amin on 07/01/2024.
//

import Foundation

protocol APIManagerProtocol {
    
    func perform(_ request: RequestProtocol, authToken: String) async throws -> Data
    func requestToken() async throws -> Data
}

final class APIManager: APIManagerProtocol {
    
    // MARK: - Properties
    
    private var urlSession: URLSession
    
    // MARK: - Init
    
    init(urlSession: URLSession = URLSession.shared) {
        
        self.urlSession = urlSession
    }
    
    // MARK: - Methods
    
    func perform(_ request: RequestProtocol, authToken: String = "") async throws -> Data {
     
        let (data, response) = try await urlSession.data(for: request.createURLRequest(authToken: authToken))
        
        guard let urlResponse = response as? HTTPURLResponse,
              urlResponse.statusCode <= 200 || urlResponse.statusCode > 300 else {
            
            throw NetworkError.invalidServerResponse
        }
        
        return data
    }
    
    func requestToken() async throws -> Data {
        
        return try await perform(AuthTokenRequest.auth)
    }
}
