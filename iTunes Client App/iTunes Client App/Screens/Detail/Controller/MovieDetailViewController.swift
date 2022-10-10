//
//  MovieDetailViewController.swift
//  iTunes Client App
//
//  Created by Ömer Faruk Kazar on 10.10.2022.
//

import UIKit

final class MovieDetailViewController: UIViewController {
    
    var movie: Movie? {
        didSet {
            title = movie?.trackName
            detailView.imageView.downloadImage(from: movie?.artworkLarge)
            detailView.releaseDate = movie?.releaseDate
            detailView.artistName = movie?.artistName
            detailView.country = movie?.country
            detailView.genres = movie?.primaryGenreName
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
