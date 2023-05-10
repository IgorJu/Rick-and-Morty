//
//  ViewController.swift
//  Rick and Morty
//
//  Created by Igor on 06.05.2023.
//

import UIKit

final class CharactersViewController: UITableViewController {
    
    private var rickAndMorty: RickAndMorty?
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 120
    }
    
    //MARK: - DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rickAndMorty?.results.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Character", for: indexPath)
        guard let cell = cell as? CharacterCell else { return UITableViewCell() }
        
        let personage = rickAndMorty?.results[indexPath.row]
        cell.configure(with: personage)
        cell.backgroundConfiguration = .clear()
        return cell
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let detailVC = segue.destination as? DetailCharacterViewController else { return }
        detailVC.personage = rickAndMorty?.results[indexPath.row]
    }
}

//MARK: - Networking
extension CharactersViewController {
    func fetchPersonages() {
        networkManager.fetch(RickAndMorty.self, from: Link.personageURL.url) { [weak self] result in
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
