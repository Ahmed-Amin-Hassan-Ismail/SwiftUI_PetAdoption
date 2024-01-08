//
//  AnimalsNearYouViewModel.swift
//  PetAdoption
//
//  Created by Ahmed Amin on 07/01/2024.
//

import Foundation

@MainActor
final class AnimalsNearYouViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var animals: [Animal] = []
    @Published var isLoading: Bool = true
    @Published var showSelectedAnimalDetails: Bool = false
    @Published var hasMoreAnimals: Bool = true
        
    private(set) var page: Int = 1
    private let service: ServiceAnimalFetcherProtocol
    
    // MARK: - Init
    
    init(service: ServiceAnimalFetcherProtocol) {
        
        self.service = service
        
        Task {
            await fetchAnimals()
        }
    }
    
    // MARK: - Methods
    
    func navigateToAnimalDetails() {
        
        showSelectedAnimalDetails = true
    }
    
    // MARK: - API Methods
    
    private func fetchAnimals() async {
        
        isLoading = true
        animals += await service.fetchAnimal(page: page)
        isLoading = false
        hasMoreAnimals = !animals.isEmpty
    }
    
    func fetchMoreAnimals() async {
        page += 1
        await fetchAnimals()
    }
}
