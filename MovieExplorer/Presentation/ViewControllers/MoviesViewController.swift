//
//  MoviesViewController.swift
//  MovieExplorer
//
//  Created by Mostafa Elemam on 17/06/2025.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    private let viewModel = MoviesViewModel(useCase: MoviesUseCase())
    private var isLoading = true
    var movies: [Movie]?
    var selectedMovie: Movie!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getMovies()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MovieDetailsViewController {
            vc.movie = selectedMovie
            vc.didUpdateMovie = {
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    // MARK: -  Functions
    private func setup() {
        navigationItem.largeTitleDisplayMode = .always
        collectionView.register(MovieCell.nib, forCellWithReuseIdentifier: MovieCell.identifier)
    }
    private func getMovies() {
        Task {
            if let movies = await viewModel.getMovies() {
                isLoading = false
                self.movies = movies
                collectionView.reloadData()
            }
        }
    }

}


// MARK: - CollectionView Datasource and Delegate
extension MoviesViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, MovieCellDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies?.count ?? 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.setTemplateWithSubviews(isLoading, viewBackgroundColor: .systemBackground)
        let movie = movies?[indexPath.item]
        cell.delegate = self
        cell.configure(with: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width - 60)/2, height: 360)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movie = movies?[indexPath.item] else { return }
        selectedMovie = movie
        performSegue(withIdentifier: K.movieDetails, sender: self)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        UIView.animate(withDuration: 0.15, delay: 0.03 * Double(indexPath.row), options: [.curveEaseInOut], animations: {
            cell.alpha = 1
            cell.transform = .identity
        })
    }
    
    func didTapFavourite(_ cell: MovieCell) {
        guard let indexPath = collectionView.indexPath(for: cell),
              let movieID = movies?[indexPath.item].id
        else { return }
        viewModel.toggleFavourite(id: movieID)
    }
}
