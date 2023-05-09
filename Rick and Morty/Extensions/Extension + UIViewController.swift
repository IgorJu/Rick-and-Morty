//
//  Extension + UIViewController.swift
//  Rick and Morty
//
//  Created by Igor on 09.05.2023.
//

import UIKit
 
extension UIViewController {
    func setupBackgroundImage(with image: String) {
        let imageView = UIImageView(image: UIImage(named: image))
        imageView.frame = view.bounds
        view.insertSubview(imageView, at: 0)
    }
}
