//
//  AnimalsNearYouView.swift
//  PetAdoption
//
//  Created by Ahmed Amin on 07/01/2024.
//

import SwiftUI

struct AnimalsNearYouView: View {
    
    // MARK: - Properties
    
    @ObservedObject private var viewModel: AnimalsNearYouViewModel
    
    // MARK: - Init
    
    init(viewModel: AnimalsNearYouViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.animals) { animal in
                    HStack {
                        AnimalRow(animal: animal)
                        Image(systemName: "chevron.right")
                    }
                    .onTapGesture {
                        viewModel.navigateToAnimalDetails()
                    }
                }
                
                if !viewModel.animals.isEmpty && viewModel.hasMoreAnimals {
                    ProgressView("Finding more animals...")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .task {
                           await viewModel.fetchMoreAnimals()
                        }
                }
                
            }
            .listStyle(.plain)
            .overlay(content: {
                if (viewModel.isLoading) && (viewModel.animals.isEmpty) {
                    ProgressView("Finding Animals near you...")
                }
            })
            .background(
                NavigationLink(isActive: $viewModel.showSelectedAnimalDetails,
                               destination: { AnimalDetailsView() },
                               label: { EmptyView() })
            )
            .navigationTitle("Animals near you")
        }
    }
}

#Preview {
    AnimalsNearYouView(
        viewModel: AnimalsNearYouViewModel(
            service: ServiceAnimalFetcher(
                requestManager: RequestManager())))
}
