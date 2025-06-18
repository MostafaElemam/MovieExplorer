//
//  MovieDetailsViewController.swift
//  MovieExplorer
//
//  Created by Mostafa Elemam on 17/06/2025.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var imageViewContainer: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var revenueLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    // MARK: - Properties
    var movie: Movie!
    private let viewModel = MoviesViewModel(useCase: MoviesUseCase())
    private var isLoading = true
    var didUpdateMovie: (() -> ())?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fillLabels()
        getMovieDetails()
    }
    
    // MARK: - Private Funcs
    private func setup() {
        navigationItem.largeTitleDisplayMode = .never
        imageViewContainer.backgroundColor = .clear
        imageViewContainer.addShadow()
        imageView.cornerRadius = 8
    }
    private func fillLabels() {
        let url = URL(string: K.imgStorageURL + movie.posterPath)
        let country = movie.productionCountries?[0].name ?? "Not Available"
        let budget = movie.budget?.formatted(.currency(code: "USD")) ?? "Not Available"
        let revenue = movie.revenue?.formatted(.currency(code: "USD")) ?? "Not Available"
        let rate = movie.voteAverage
        view.setTemplateWithSubviews(isLoading, viewBackgroundColor: .systemBackground)
        
        imageView.sd_setImage(with: url)
        favButton.isSelected = movie.isFavourite
        movieNameLabel.text = movie.title
        overviewLabel.text = movie.overview
        releaseDateLabel.text = "Release Date: \(movie.releaseDate.formattedFromDate)"
        countryLabel.text = "Country: \(country)"
        budgetLabel.text = "Budget: \(budget)"
        revenueLabel.text = "Revenue: \(revenue)"
        rateLabel.text = "Rate: \(rate)"
    }
    private func getMovieDetails() {
        Task {
            if let movieWithDetails = await viewModel.getMovie(movie.id) {
                DispatchQueue.main.async {
                    self.movie = movieWithDetails
                    self.isLoading = false
                    self.fillLabels()
                }
            }
        }
    }
    // MARK: - IBActions
    @IBAction func didTapFavButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        viewModel.toggleFavourite(id: movie.id)
        didUpdateMovie?()
    }
}
