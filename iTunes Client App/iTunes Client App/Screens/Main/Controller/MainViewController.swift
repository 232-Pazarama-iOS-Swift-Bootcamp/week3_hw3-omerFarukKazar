//
//  MainViewController.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 1.10.2022.
//

import UIKit

final class MainViewController: UIViewController {

    
    
    let searchController = UISearchController()
    
    // MARK: - Properties
    private let mainView = MainView()
    private let networkService = BaseNetworkService()
    private var podcastResponse: PodcastResponse? {
        didSet {
            mainView.refresh()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Podcasts"
        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        fetchPodcasts()
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(podcastFavoritesTapped))
    }
    
    // MARK: - Methods
    private func fetchPodcasts() {
        networkService.request(PodcastRequest()) { result in
            switch result {
            case .success(let response):
                self.podcastResponse = response
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
    
    @objc func podcastFavoritesTapped() {
        
    }
}


// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.podcast = podcastResponse?.results?[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        podcastResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PodcastCollectionViewCell
        let podcast = podcastResponse?.results?[indexPath.row]
        cell.title = podcast?.trackName
        cell.imageView.downloadImage(from: podcast?.artworkLarge)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}

// MARK: - Search Controller

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
}


