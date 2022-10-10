//
//  MusicDetailViewController.swift
//  iTunes Client App
//
//  Created by Ömer Faruk Kazar on 10.10.2022.
//

import UIKit

final class MusicDetailViewController: UIViewController {
    
    var music: Music? {
        didSet {
            title = music?.trackName
            detailView.imageView.downloadImage(from: music?.artworkLarge)
            detailView.releaseDate = music?.releaseDate
            detailView.artistName = music?.artistName
            detailView.country = music?.country
            detailView.genres = music?.primaryGenreName
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
