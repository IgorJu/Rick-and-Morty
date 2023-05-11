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
    let location: Location
    let episode: [URL]
    
    var description: String {
        """
    Name: \(name)
    Status: \(status)
    Spesies: \(species)
    Gender: \(gender)
    Location: \(location.name)
    """
    }
}

struct Location: Decodable {
    let name: String
}

struct Episode: Decodable {
    let name: String
    let date: String
    let episode: String
    let characters: [URL]
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case date = "air_date"
        case episode = "episode"
        case characters = "characters"
    }
}

