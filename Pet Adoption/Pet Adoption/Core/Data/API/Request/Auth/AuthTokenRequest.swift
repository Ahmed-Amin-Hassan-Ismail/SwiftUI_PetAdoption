//
//  AuthTokenRequest.swift
//  PetAdoption
//
//  Created by Ahmed Amin on 07/01/2024.
//

import Foundation

enum AuthTokenRequest: RequestProtocol {
    
    case auth
    
    var path: String {
        return "/v2/oauth2/token"
    }
    
    var params: [String: Any] {
        [
          "grant_type": APIConstants.grantType,
          "client_id": APIConstants.clientId,
          "client_secret": APIConstants.clientSecret
        ]
    }
    
    var addAuthorizationToken: Bool {
        return false
    }
    
    var requestType: RequestType {
        return .POST
    }
}
