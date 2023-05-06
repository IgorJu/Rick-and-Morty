//
//  ViewController.swift
//  Rick and Morty
//
//  Created by Igor on 06.05.2023.
//

import UIKit

enum Link: CaseIterable {
    case rickURL
    case mortyURL
    
    var url: URL {
        switch self {
        case .rickURL:
            return URL(string: "https://rickandmortyapi.com/api/character/1")!
        case .mortyURL:
            return URL(string: "https://rickandmortyapi.com/api/character/2")!
        }
    }
}

final class CharactersViewController: UITableViewController {
    private let characters = Link.allCases
    
    //MARK: - DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Character", for: indexPath)
        cell.backgroundConfiguration = .clear()
        
        return cell
    }
    
    //MARK: - Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let link = characters[indexPath.row]
        
        switch link {
        case .rickURL: fetchRick()
        case .mortyURL: fetchMorty()
        }
    }
}

//MARK: - Networking
extension CharactersViewController {
    private func fetchRick() {
        URLSession.shared.dataTask(with: Link.rickURL.url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error Description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let character = try decoder.decode(CharacterInfo.self, from: data)
                print(character)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    private func fetchMorty() {
        URLSession.shared.dataTask(with: Link.mortyURL.url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error Description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let character = try decoder.decode(CharacterInfo.self, from: data)
                print(character)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

