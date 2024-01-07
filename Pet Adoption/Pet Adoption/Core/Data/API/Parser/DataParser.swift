//
//  DataParser.swift
//  PetAdoption
//
//  Created by Ahmed Amin on 07/01/2024.
//

import Foundation

protocol DataParserProtocol {
    
    func parse<T: Decodable>(data: Data) throws -> T
}

final class DataParser: DataParserProtocol {
    
    // MARK: - Properties
    
    private let jsonDecoder: JSONDecoder
    
    // MARK: - Init
    
    init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
        self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func parse<T>(data: Data) throws -> T where T: Decodable {
        
        return try jsonDecoder.decode(T.self, from: data)
    }
}
