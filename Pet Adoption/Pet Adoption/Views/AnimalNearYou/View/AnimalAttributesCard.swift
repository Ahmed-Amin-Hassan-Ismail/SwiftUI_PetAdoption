//
//  AnimalAttributesCard.swift
//  PetAdoption
//
//  Created by Ahmed Amin on 08/01/2024.
//

import SwiftUI

struct AnimalAttributesCard: ViewModifier {
    
    private let color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    func body(content: Content) -> some View {
        
        content
            .padding(4)
            .background(color.opacity(0.2))
            .cornerRadius(8)
            .foregroundColor(color)
            .font(.subheadline)
    }
}
