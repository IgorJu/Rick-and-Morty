//
//  Character.swift
//  Rick and Morty
//
//  Created by Igor on 06.05.2023.
//

import Foundation

struct RickAndMorty: Decodable {
    let results: [Personage]
}

struct Personage: Decodable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: URL
    
    var description: String {
        """
Name:   \(name)
Status:   \(status)
Spesies:   \(species)
Gender:   \(gender)
"""
    }
}

//MARK: - Location R&M
struct RickAndMortyLocation: Decodable {
    let results: [Location]
}

struct Location: Decodable {
    let name: String
    let type: String
    let dimension: String
    
    var description: String {
        """
Type: \(type)
Dimension: \(dimension)
"""
    }
}
