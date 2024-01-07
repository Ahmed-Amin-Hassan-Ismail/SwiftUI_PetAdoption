//
//  AnimalIsNearYouViewModel.swift
//  PetAdoption
//
//  Created by Ahmed Amin on 07/01/2024.
//

import Foundation

final class AnimalIsNearYouViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var animals: [Animal]?
    @Published var isLoading: Bool = true
    
    private let requestManager = RequestManager()
    
    // MARK: - Init
    
    init() {
        Task {
            await fetchAnimals()
        }
    }
    
    // MARK: - Methods
    
    @MainActor
    private func fetchAnimals() async {
        
        do {
            
            let request = AnimalsRequest.getAnimalsWith(page: 1, 
                                                        latitude: nil,
                                                        longitude: nil)
            let animalContainer: AnimalsContainer = try await requestManager.perform(request)
            
            self.animals = animalContainer.animals
            self.isLoading = false
            
        } catch {
            
            print(error.localizedDescription)
        }
    }
}
