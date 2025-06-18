//
//  MoviesService.swift
//  MovieExplorer
//
//  Created by Mostafa Elemam on 16/06/2025.
//

import Foundation

class MoviesService {
    private let networkService: NetworkService
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
    
    // MARK: - Download Movies
    func downloadMovies() async -> [Movie]? {
        do {
            let movies: Movies = try await networkService.download(from: K.moviesURL)
            return movies.results
        } catch let error as NetworkError {
            await Helpers.showBanner(error.errorDescription)
        }
        catch {}
        return nil
    }
    
    // MARK: - Download Movie by ID
    func downloadMovie(_ id: Int) async -> Movie? {
        let url = K.movieDetailsURL + "\(id)"
        do {
            let movie: Movie = try await networkService.download(from: url)
            return movie
            
        } catch let error as NetworkError {
            await Helpers.showBanner(error.errorDescription)
        }
        catch {}
        return nil
    }
}
