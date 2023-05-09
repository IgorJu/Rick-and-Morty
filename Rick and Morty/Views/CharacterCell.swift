//
//  CharacterCell.swift
//  Rick and Morty
//
//  Created by Igor on 06.05.2023.
//

import UIKit

final class CharacterCell: UITableViewCell {

    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    
    private let networkManager = NetworkManager.shared
    
    func configure(with personage: Character?) {
        guard let personage else { return }
        nameLabel.text = personage.name

        networkManager.fetchImage(from: personage.image) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.characterImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }

    }
}

