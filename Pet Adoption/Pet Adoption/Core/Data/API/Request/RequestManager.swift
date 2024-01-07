//
//  RequestManager.swift
//  PetAdoption
//
//  Created by Ahmed Amin on 07/01/2024.
//

import Foundation

protocol RequestManagerProtocol {
    
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

final class RequestManager: RequestManagerProtocol {
    
    // MARK: - Properties
    
    private let apiManager: APIManagerProtocol
    private let parser: DataParserProtocol
    
    // MARK: - Init
    
    init(apiManager: APIManagerProtocol = APIManager(), parser: DataParserProtocol = DataParser()) {
        self.apiManager = apiManager
        self.parser = parser
    }
    
    // MARK: - Methods
    
    private func requestAccessToken() async throws -> String {
        
        let data = try await apiManager.requestToken()
        
        let token: APIToken = try parser.parse(data: data)
        
        return token.bearerAccessToken
    }
    
    func perform<T>(_ request: RequestProtocol) async throws -> T where T: Decodable {
        
        let authToken = try await requestAccessToken()
        
        let data = try await apiManager.perform(request, authToken: authToken)
        
        let decoded: T = try parser.parse(data: data)
        
        return decoded
    }
}
