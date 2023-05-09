//
//  ViewController.swift
//  Rick and Morty
//
//  Created by Igor on 06.05.2023.
//

import UIKit
   
final class CharactersViewController: UITableViewController {
    
    private var rickAndMorty: RickAndMorty?
    private let character: [Character] = []
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }
    
    //MARK: - DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rickAndMorty?.results.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Character", for: indexPath)
        guard let cell = cell as? CharacterCell else { return UITableViewCell() }
        let personage = rickAndMorty?.results[indexPath.row]
        cell.backgroundConfiguration = .clear()
        cell.configure(with: personage)
        return cell
    }
}
    


//MARK: - Networking
extension CharactersViewController {
    func fetchCharacters() {
        networkManager.fetch(RickAndMorty.self, from: Link.characterURL.url) { [weak self] result in
            switch result {
            case .success(let rickAndMorty):
                self?.rickAndMorty = rickAndMorty
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
    
//    private func fetchLocations() {
//        URLSession.shared.dataTask(with: Link.locationURL.url) { data, _, error in
//            guard let data else {
//                print(error?.localizedDescription ?? "No error Description")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let character = try decoder.decode(Locations.self, from: data)
//                print(character)
//            } catch {
//                print(error.localizedDescription)
//            }
//        }.resume()
//    }



