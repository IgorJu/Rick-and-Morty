//
//  Character.swift
//  Rick and Morty
//
//  Created by Igor on 06.05.2023.
//

import Foundation

struct RickAndMorty: Decodable {
    let results: [Character]
}

struct Character: Decodable {
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: URL
    
    var description: String {
        """
Name: \(name)
Status: \(status)
Spesies: \(species)
Type: \(type)
Gender: \(gender)
"""
    }
}

//MARK: - Location R&M
