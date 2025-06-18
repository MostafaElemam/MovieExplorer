//
//  MoviesRepositry.swift
//  MovieExplorer
//
//  Created by Mostafa Elemam on 18/06/2025.
//

import Foundation

class MoviesRepositry {
    
    private let moviesService: MoviesService
    init(moviesService: MoviesService = MoviesService()) {
        self.moviesService = moviesService
    }
    
    func getMovies() async -> [Movie]? {
        await moviesService.downloadMovies()
    }
    func getMovie(_ id: Int) async -> Movie? {
        await moviesService.downloadMovie(id)
        
    }
    
}
