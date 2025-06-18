//
//  FavouriteMovieManager.swift
//  MovieExplorer
//
//  Created by Mostafa Elemam on 17/06/2025.
//

import Foundation

class FavouriteMovieManager {
    static let shared = FavouriteMovieManager()
    var favouriteMovies: Set<Int> {
        get { loadMyFavouriteMovies() }
        set { UserDefaults.standard.set(Array(newValue), forKey: "myFavMovies") }
    }
    
    private init() {}
    
    // MARK: - Functions
    func loadMyFavouriteMovies() -> Set<Int> {
        if let favMovies = UserDefaults.standard.array(forKey: "myFavMovies") as? [Int] {
            return Set(favMovies)
        }
        return []
    }
    func addOrRemoveMovie(id: Int) {
        if favouriteMovies.contains(id) {
            favouriteMovies.remove(id)
        } else  {
            favouriteMovies.insert(id)
        }
    }
    func isFavourite(id: Int) -> Bool {
        favouriteMovies.contains(id)
    }
}
