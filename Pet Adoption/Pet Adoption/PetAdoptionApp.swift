//
//  PetAdoptionApp.swift
//  Pet Adoption
//
//  Created by Ahmed Amin on 03/01/2024.
//

import SwiftUI

@main
struct PetAdoptionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class Service: AnimalFetcher {
    
    func fetchAnimals() {
        // fetching animals .....
    }
}

protocol AnimalFetcher {
    func fetchAnimals() // known as POP which now the confirmed class can be used with different context and different purpose ....
}

class AnimalNearYouViewModel {
    let service: AnimalFetcher // so viewModel is depend on service and service is concrete type and this is wrong....
    
    
    init(service: AnimalFetcher) {
        self.service = service
    }
    
    func fetchAnimal() {
        service.fetchAnimals()
    }
}
