//
//  LocationCell.swift
//  Rick and Morty
//
//  Created by Igor on 09.05.2023.
//

import UIKit

final class LocationCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    func configure(with location: Location?) {
        guard let location else { return }
        nameLabel.text = location.name
        descriptionLabel.text = location.description
    }
}
