//
//  CharacterCell.swift
//  Rick and Morty
//
//  Created by Igor on 06.05.2023.
//

import UIKit

final class CharacterCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var characterImageView: UIImageView! {
        didSet {
            characterImageView.layer.cornerRadius = characterImageView.frame.height / 3
            
        }
    }
    
    private let networkManager = NetworkManager.shared
    
    func configure(with personage: Personage?) {
        guard let personage else { return }
        nameLabel.text = personage.name

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

