//
//  SoftwareDetailViewController.swift
//  iTunes Client App
//
//  Created by Ömer Faruk Kazar on 10.10.2022.
//

import UIKit

final class SoftwareDetailViewController: UIViewController {
    
    var software: Software? {
        didSet {
            title = software?.collectionName
            detailView.imageView.downloadImage(from: software?.artworkLarge)
            detailView.releaseDate = software?.releaseDate
            detailView.artistName = software?.artistName
            detailView.country = software?.country
            detailView.genres = software?.primaryGenreName
        }
    }
    
    private let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add To Favorites", style: .plain, target: self, action: #selector(addToFavoritesTapped))
    }
    
    @objc func addToFavoritesTapped() {
        
    }
}
