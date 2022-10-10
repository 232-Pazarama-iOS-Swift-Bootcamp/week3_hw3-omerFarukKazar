//
//  DetailViewController.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 2.10.2022.
//

import UIKit

final class DetailViewController: UIViewController {
    
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    var podcast: Podcast? {
        didSet {
            title = podcast?.trackName
            detailView.imageView.downloadImage(from: podcast?.artworkLarge)
            detailView.releaseDate = podcast?.releaseDate
            detailView.artistName = podcast?.artistName
            detailView.country = podcast?.country
            detailView.genres = podcast?.genres?.reduce("") { $1 + ", " + $0 }
        }
    }
    
    private let detailView = DetailView() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add To Favorites", style: .plain, target: self, action: #selector(addToFavoritesTapped))
    }
    
    @objc func addToFavoritesTapped() {
        print("Tapped")
    }
    
//    func getAllItems() {
//        let items = context.fetch(<#T##request: NSFetchRequest<NSFetchRequestResult>##NSFetchRequest<NSFetchRequestResult>#>)
//    }
//
//    func createItems(name: String) {
//
//    }
//    func deleteItem(item: Podcast.CodingKeys) {
//
//    }
//    func updateItem(item: Podcast.CodingKeys) {
//
//    }
}
