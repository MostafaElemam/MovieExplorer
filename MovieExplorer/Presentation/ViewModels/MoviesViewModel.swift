//
//  MoviesViewModel.swift
//  MovieExplorer
//
//  Created by Mostafa Elemam on 16/06/2025.
//

import Foundation

class MoviesViewModel {
    private let useCase: MoviesUseCase
    private let favouriteMovieManager = FavouriteMovieManager.shared
    init(useCase: MoviesUseCase) {
        self.useCase = useCase
    }
    
    // MARK: - Functions
    func getMovies() async -> [Movie]? {
        await useCase.getMovies()
    }
    
    func getMovie(_ id: Int) async -> Movie? {
        await useCase.getMovie(id)
    }
    func toggleFavourite(id: Int) {
        favouriteMovieManager.addOrRemoveMovie(id: id)
    }
    var favouriteMovies: Set<Int> {
        favouriteMovieManager.favouriteMovies
    }
}
