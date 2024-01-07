//
//  AnimalsNearYouView.swift
//  PetAdoption
//
//  Created by Ahmed Amin on 07/01/2024.
//

import SwiftUI

struct AnimalsNearYouView: View {
    
    @StateObject private var viewModel = AnimalIsNearYouViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.animals ?? []) { animal in
                    AnimalRow(animal: animal)
                }
                
            }
            .listStyle(.plain)
            .overlay(content: {
                if viewModel.isLoading {
                    ProgressView("Finding Animals near you...")
                }
            })
            .navigationTitle("Animals near you")
        }
    }
}

#Preview {
    AnimalsNearYouView()
}
