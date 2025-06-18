//
//  MockMoviesRepository.swift
//  MovieExplorerTests
//
//  Created by Mostafa Elemam on 18/06/2025.
//

import Foundation
@testable import MovieExplorer

class MockMoviesRepository: MoviesRepositry {
    var mockMovies: [Movie] = []
    var mockMovie: Movie?
    
    func getMovies() async -> [Movie]? {
        return mockMovies
    }
    
    func getMovie(_ id: Int) async -> Movie? {
        return mockMovie
    }
    
    
}
