//
//  EBookTabViewController.swift
//  iTunes Client App
//
//  Created by Ömer Faruk Kazar on 10.10.2022.
//

import UIKit

final class EBookTabViewController: UIViewController {
    
    private let mainView = MainView()
    private let networkService = BaseNetworkService()
    private var eBookResponse: EBookResponse? {
        didSet {
            mainView.refresh()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "EBook"
        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        fetchEBooks()
    }
    
    private func fetchEBooks() {
        networkService.request(EBookRequest()) { result in
            switch result {
            case .success(let response):
                self.eBookResponse = response
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
}


// MARK: - UICollectionViewDelegate
extension EBookTabViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = EBookDetailViewController()
        detailViewController.eBook = eBookResponse?.results?[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension EBookTabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        eBookResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PodcastCollectionViewCell
        let software = eBookResponse?.results?[indexPath.row]
        cell.title = software?.trackName
        cell.imageView.downloadImage(from: software?.artworkLarge)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}
