//
//  MainViewController.swift
//  Rick and Morty
//
//  Created by Igor on 08.05.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    //MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundImage(with: "RickMorty")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPersonages" {
            guard let charactersVC = segue.destination as? CharactersViewController else  { return }
            charactersVC.fetchPersonages()
        } else {
            guard let locationsVC = segue.destination as? LocationListViewController else { return }
            locationsVC.fetchLocations()
        }
    }
    
    //MARK: - IBActions
    @IBAction func showPersonagesTapped(_ sender: Any) {
        performSegue(withIdentifier: "showPersonages", sender: nil)
    }
    
    @IBAction func showLocationsTapped(_ sender: Any) {
        performSegue(withIdentifier: "showLocations", sender: nil)
    }
    
}
