//
//  Pagination.swift
//  PetAdoption
//
//  Created by Ahmed Amin on 04/01/2024.
//

import Foundation

struct Pagination: Codable {
  let countPerPage: Int
  let totalCount: Int
  let currentPage: Int
  let totalPages: Int
}
