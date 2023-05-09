//
//  LocationListViewController.swift
//  Rick and Morty
//
//  Created by Igor on 09.05.2023.
//

import UIKit

final class LocationListViewController: UITableViewController {
    
    private var location: RickAndMortyLocation?
    private let networkManager = NetworkManager.shared
    
    //MARK: - DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return location?.results.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Location", for: indexPath)
        guard let cell = cell as? LocationCell else { return UITableViewCell() }
        
        let location = location?.results[indexPath.row]
        cell.configure(with: location)
        cell.backgroundConfiguration = .clear()
        return cell
    }
}

//MARK: - Networking
extension LocationListViewController {
    func fetchLocations() {
        networkManager.fetch(RickAndMortyLocation.self, from: Link.locationURL.url) { [weak self] result in
            switch result {
            case .success(let location):
                self?.location = location
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
        
    
