//
//  MainViewController.swift
//  Rick and Morty
//
//  Created by Igor on 08.05.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let networkManager = NetworkManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: (UIImage(named: "RickMorty")))
        imageView.frame = view.bounds
        view.insertSubview(imageView, at: 0)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPersonages" {
            guard let charactersVC = segue.destination as? CharactersViewController else  { return }
            charactersVC.fetchCharacters()
        }
    }

    
//MARK: - IBActions
    @IBAction func showPersonagesTapped(_ sender: Any) {
        performSegue(withIdentifier: "showPersonages", sender: nil)
    }
    
    @IBAction func showLocationsTapped(_ sender: Any) {
    }
    
}
