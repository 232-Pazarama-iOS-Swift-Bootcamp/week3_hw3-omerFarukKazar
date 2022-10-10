//
//  MovieTabViewController.swift
//  iTunes Client App
//
//  Created by Ömer Faruk Kazar on 10.10.2022.
//

import UIKit

final class MovieTabViewController: UIViewController {
    
    let searchController = UISearchController()
    private let mainView = MainView()
    private let networkService = BaseNetworkService()
    private var movieResponse: MovieResponse? {
        didSet {
            mainView.refresh()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie"
        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        fetchMovies()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(addTapped))
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
    }
    
    private func fetchMovies() {
        networkService.request(MovieRequest()) { result in
            switch result {
            case .success(let response):
                self.movieResponse = response
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
    @objc func addTapped() {
        
    }
}

// MARK: - UICollectionViewDelegate
extension MovieTabViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = MovieDetailViewController()
        detailViewController.movie = movieResponse?.results?[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension MovieTabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PodcastCollectionViewCell
        let podcast = movieResponse?.results?[indexPath.row]
        cell.title = podcast?.trackName
        cell.imageView.downloadImage(from: podcast?.artworkLarge)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}

extension MovieTabViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
}


