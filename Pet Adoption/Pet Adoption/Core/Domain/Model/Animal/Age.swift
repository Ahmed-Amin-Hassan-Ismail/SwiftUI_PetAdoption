//
//  Age.swift
//  PetAdoption
//
//  Created by Ahmed Amin on 04/01/2024.
//

import SwiftUI

enum Age: String, Codable, CaseIterable {
  case baby = "Baby"
  case young = "Young"
  case adult = "Adult"
  case senior = "Senior"
  case unknown = "Unknown"
}

// MARK: - Agewise Color

extension Age {
  var color: Color {
    switch self {
    case .baby:
      return .cyan
    case .young:
      return .orange
    case .adult:
      return .green
    case .senior:
      return .blue
    case .unknown:
      return .clear
    }
  }
}
