//
//  NetworkManager.swift
//  Rick and Morty
//
//  Created by Igor on 09.05.2023.
//

import Foundation

enum Link {
    case characterURL
    case locationURL
    
    var url: URL {
        switch self {
        case .characterURL:
            return URL(string: "https://rickandmortyapi.com/api/character")!
        case .locationURL:
            return URL(string: "https://rickandmortyapi.com/api/location")!
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init () {}
    
    func fetchImage(from url: URL, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    func fetch<T: Decodable>(_ type: T.Type, from url: URL, completion: @escaping(Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error Description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let dataModel = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(dataModel))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
        
    
        
        
        
        
    
}
