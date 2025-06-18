//
//  MoviesViewModel.swift
//  MovieExplorer
//
//  Created by Mostafa Elemam on 16/06/2025.
//

import Foundation

class MoviesViewModel {
    private let useCase: MoviesListUseCase
    init(useCase: MoviesListUseCase) {
        self.useCase = useCase
    }
    
    // MARK: - Functions
    func getMovies() async -> [Movie]? {
        await useCase.execute()
    }
    
    func toggleFavourite(id: Int) {
        FavouriteMovieManager.shared.addOrRemoveMovie(id: id)
    }

}
