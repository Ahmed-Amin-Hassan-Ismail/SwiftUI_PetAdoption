//
//  AccessTokenManager.swift
//  PetAdoption
//
//  Created by Ahmed Amin on 07/01/2024.
//

import Foundation

protocol AccessTokenManagerProtocol {
    
    func isTokenValid() -> Bool
    func fetchToken() -> String
    func refreshWith(apiToken: APIToken) throws
}

final class AccessTokenManager: AccessTokenManagerProtocol {
    
    // MARK: Properties
    
    private let userDefaults: UserDefaults
    private var accessToken: String?
    private var expiresAt = Date()
    
    // MARK: - Init
    
    init(userDefaults: UserDefaults = .standard) {
        
        self.userDefaults = userDefaults
    }
    
    func isTokenValid() -> Bool {
        
        update()
        return accessToken != nil && expiresAt.compare(Date()) == .orderedDescending
    }
    
    func fetchToken() -> String {
        guard let token = accessToken else { return "" }
        
        return token
    }
    
    func refreshWith(apiToken: APIToken) throws {
        let expiresAt = apiToken.expiresAt
        let token = apiToken.bearerAccessToken
        
        save(token: apiToken)
        self.expiresAt = expiresAt
        self.accessToken = token
        
    }
}

// MARK: - UserDefault

private extension AccessTokenManager {
    
    func save(token: APIToken) {
        userDefaults.setValue(token.expiresAt.timeIntervalSince1970, forKey: KeyConstants.expiresAt)
        userDefaults.setValue(token.bearerAccessToken, forKey: KeyConstants.bearerAccessToken)
    }
    
    func getExpirationDate() -> Date {
        Date(timeIntervalSince1970: userDefaults.double(forKey: KeyConstants.expiresAt))
    }
    
    func getToken() -> String? {
        userDefaults.string(forKey: KeyConstants.bearerAccessToken)
    }
    
    func update() {
        accessToken = getToken()
        expiresAt = getExpirationDate()
    }
    
}
