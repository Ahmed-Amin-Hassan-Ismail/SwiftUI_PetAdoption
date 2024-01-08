//
//  Breed.swift
//  PetAdoption
//
//  Created by Ahmed Amin on 04/01/2024.
//

import Foundation

struct Breed: Codable {
  var id: Int?
  var primary: String?
  var secondary: String?
  var mixed: Bool?
  var unknown: Bool?
    
    var breed: String {
      return primary ?? secondary ?? ""
    }
}
