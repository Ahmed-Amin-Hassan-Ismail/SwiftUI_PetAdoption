//
//  AuthTokenModel.swift
//  PetAdoption
//
//  Created by Ahmed Amin on 07/01/2024.
//

import Foundation

struct APIToken {
  let tokenType: String
  let expiresIn: Int
  let accessToken: String
}

// MARK: - Codable

extension APIToken: Codable {
  enum CodingKeys: String, CodingKey {
    case tokenType
    case expiresIn
    case accessToken
  }
}

extension APIToken {
    var expiresAt: Date {
        Calendar.current.date(byAdding: .second, value: expiresIn, to: Date()) ?? Date()
    }
    
    var bearerAccessToken: String {
      "\(tokenType) \(accessToken)"
    }
}
