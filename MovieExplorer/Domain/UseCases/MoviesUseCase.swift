//
//  MoviesUseCase.swift
//  MovieExplorer
//
//  Created by Mostafa Elemam on 18/06/2025.
//

import Foundation

class MoviesUseCase {
    private let repository: MoviesRepositry
    init(repo: MoviesRepositry = MoviesRepositry()) {
        self.repository = repo
    }
    
    func getMovies() async -> [Movie]? {
        await repository.getMovies()
    }
    func getMovie(_ id: Int) async -> Movie? {
        await repository.getMovie(id)
    }
}
