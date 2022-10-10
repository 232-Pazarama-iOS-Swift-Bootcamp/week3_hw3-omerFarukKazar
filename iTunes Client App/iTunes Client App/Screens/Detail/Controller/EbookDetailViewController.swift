//
//  EbookDetailViewController.swift
//  iTunes Client App
//
//  Created by Ömer Faruk Kazar on 10.10.2022.
//

import UIKit

final class EBookDetailViewController: UIViewController {
    
    var eBook: EBook? {
        didSet {
            title = eBook?.trackName
            detailView.imageView.downloadImage(from: eBook?.artworkLarge)
            detailView.releaseDate = eBook?.releaseDate
            detailView.artistName = eBook?.artistName
            detailView.country = eBook?.country
            detailView.genres = eBook?.genres?.reduce("") { $1 + ", " + $0 }
        }
    }
    
    private let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
    }
}
