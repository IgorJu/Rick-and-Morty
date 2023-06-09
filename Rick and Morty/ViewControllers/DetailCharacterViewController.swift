//
//  DetailCharacterViewController.swift
//  Rick and Morty
//
//  Created by Igor on 09.05.2023.
//

import UIKit

final class DetailCharacterViewController: UIViewController {
    
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var characterImageView: UIImageView! {
        didSet {
            characterImageView.layer.cornerRadius = characterImageView.frame.height / 2
        }
    }
    
    private let networkManager = NetworkManager.shared
    
    var personage: Personage!
    
    //MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = personage.name
        descriptionLabel.text = personage.description
        fetchImage()
        setupBackgroundImage(with: "RickDetail")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let episodeVC = segue.destination as? EpisodeListViewController else { return }
                episodeVC.personage = personage
    }
    
    //MARK: - Networking
    private func fetchImage() {
        networkManager.fetchImage(from: personage.image) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.characterImageView.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
