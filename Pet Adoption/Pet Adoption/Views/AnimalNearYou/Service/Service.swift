//
//  Service.swift
//  PetAdoption
//
//  Created by Ahmed Amin on 08/01/2024.
//

import Foundation

protocol ServiceAnimalFetcherProtocol {
    
    func fetchAnimal(page: Int) async -> [Animal]
}

struct ServiceAnimalFetcher {
    
    // MARK: - Properties
    
   private let requestManager: RequestManagerProtocol
    
    // MARK: - Init
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
}

extension ServiceAnimalFetcher: ServiceAnimalFetcherProtocol {
    
    func fetchAnimal(page: Int) async -> [Animal] {
        
        let requestData = AnimalsRequest.getAnimalsWith(page: page,
                                                        latitude: nil,
                                                        longitude: nil)
        
        do {
            let animalsContainer: AnimalsContainer = try await requestManager.perform(requestData)
            return animalsContainer.animals
            
        } catch {
            
            print(error.localizedDescription)
        }
        return []
    }
}
