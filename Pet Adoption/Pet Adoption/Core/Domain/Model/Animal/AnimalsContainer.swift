//
//  AnimalsContainer.swift
//  PetAdoption
//
//  Created by Ahmed Amin on 07/01/2024.
//

import Foundation

struct AnimalsContainer: Decodable {
  let animals: [Animal]
  let pagination: Pagination
}
