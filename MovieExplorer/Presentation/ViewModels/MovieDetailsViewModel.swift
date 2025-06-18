//
//  MovieDetailsViewModel.swift
//  MovieExplorer
//
//  Created by Mostafa Elemam on 18/06/2025.
//

import Foundation

class MovieDetailsViewModel {
    private let useCase: MovieDetailsUseCase
    init(useCase: MovieDetailsUseCase) {
        self.useCase = useCase
    }
    
    // MARK: - Functions
    func getMovie(_ id: Int) async -> Movie? {
        await useCase.execute(for: id)
    }
    
    func toggleFavourite(id: Int) {
        FavouriteMovieManager.shared.addOrRemoveMovie(id: id)
    }
}
