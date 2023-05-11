//
//  EpisodeListViewController.swift
//  Rick and Morty
//
//  Created by Igor on 11.05.2023.
//

import UIKit

class EpisodeListViewController: UITableViewController {

    private let networkManager = NetworkManager.shared
    
    var personage: Personage!
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personage.episode.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episode", for: indexPath)
        var content = cell.defaultContentConfiguration()
        cell.backgroundConfiguration = .clear()
        
        let episodeURL  = personage.episode[indexPath.row]
        fetchEpisode(from: episodeURL) { episode in
            content.text = episode.name
            content.textProperties.color = .yellow
            cell.contentConfiguration = content
        }
        return cell
    }
}

//MARK: - Networking
extension EpisodeListViewController {
    private func fetchEpisode(from url: URL, closure: @escaping(Episode) -> Void ){
        networkManager.fetch(Episode.self, from: url) { result in
            switch result {
            case .success(let episode):
                closure(episode)
            case .failure(let error):
                print(error)
            }
        }
    }
}
