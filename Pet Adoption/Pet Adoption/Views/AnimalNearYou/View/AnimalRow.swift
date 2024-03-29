//
//  AnimalRow.swift
//  PetAdoption
//
//  Created by Ahmed Amin on 07/01/2024.
//

import SwiftUI

struct AnimalRow: View {
    
    // MARK: - Properties
    
    private let animal: Animal
    
    // MARK: - Init
    
    init(animal: Animal) {
        self.animal = animal
    }
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            AsyncImage(url: animal.picture, content: { image in
                image
                    .resizable()
            }, placeholder: {
                Image("DogPlaceholder")
                    .resizable()
                    .overlay {
                        if animal.picture != nil {
                            ProgressView()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(.gray.opacity(0.4))
                        }
                    }
            })
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .frame(width: 112, height: 112)
            
            VStack(alignment: .leading) {
                Text(animal.name)
                    .multilineTextAlignment(.leading)
                    .font(.title3)
                
                Text("\(animal.breeds.breed) \(animal.type)")
                    .font(.callout)
                
                if let description = animal.description {
                  Text(description)
                    .lineLimit(2)
                    .font(.footnote)
                }
                
                HStack {
                  Text(animal.age.rawValue)
                    .modifier(AnimalAttributesCard(color: animal.age.color))
                  Text(animal.gender.rawValue)
                    .modifier(AnimalAttributesCard(color: .pink))
                }
            }
            .lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    AnimalRow(animal: Animal.mock!.first!)
}
