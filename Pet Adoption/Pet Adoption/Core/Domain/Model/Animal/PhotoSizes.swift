//
//  PhotoSizes.swift
//  PetAdoption
//
//  Created by Ahmed Amin on 04/01/2024.
//

import Foundation

struct PhotoSizes: Codable {
  var id: Int?
  var small: URL?
  var medium: URL?
  var large: URL?
  var full: URL?
}
