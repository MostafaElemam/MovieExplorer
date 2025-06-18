//
//  MoviesListUseCase.swift
//  MovieExplorer
//
//  Created by Mostafa Elemam on 18/06/2025.
//

import Foundation

class MoviesListUseCase {
    private let repository: MoviesRepositry
    init(repo: MoviesRepositry = MoviesRepositryImpl()) {
        self.repository = repo
    }
    
    func execute() async -> [Movie]? {
        await repository.getMovies()
    }
}
