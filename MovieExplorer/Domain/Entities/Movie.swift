//
//  Movie.swift
//  MovieExplorer
//
//  Created by Mostafa Elemam on 16/06/2025.
//

import Foundation

// MARK: - Movies
struct Movies: Codable {
    let page: Int
    let results: [Movie]
}

// MARK: - Movie
struct Movie: Codable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let voteAverage: Double
    let productionCountries: [Country]?
    let budget: Int?
    let revenue: Int?
    var isFavourite: Bool {
        FavouriteMovieManager.shared.isFavourite(id: id)
    }
    
    struct Country: Codable {
        let name: String
    }
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview, budget, revenue
        case posterPath     = "poster_path"
        case releaseDate    = "release_date"
        case voteAverage    = "vote_average"
        case productionCountries = "production_countries"
    }
}
    

    
