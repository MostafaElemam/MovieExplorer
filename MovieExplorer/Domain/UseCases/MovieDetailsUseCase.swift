//
//  MovieDetailsUseCase.swift
//  MovieExplorer
//
//  Created by Mostafa Elemam on 18/06/2025.
//

import Foundation


class MovieDetailsUseCase {
    private let repository: MoviesRepositry
    init(repo: MoviesRepositry = MoviesRepositryImpl()) {
        self.repository = repo
    }
    
    func execute(for id: Int) async -> Movie? {
        await repository.getMovie(id)
    }
}


