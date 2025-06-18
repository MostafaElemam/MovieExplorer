//
//  MoviesViewModelTests.swift
//  MovieExplorerTests
//
//  Created by Mostafa Elemam on 19/06/2025.
//

import XCTest
@testable import MovieExplorer

final class MoviesViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func test_MoviesViewModel_getMovies_returnsMovies() async {
        //Given
        let mockRepo = MockMoviesRepository()
        mockRepo.mockMovies = [
            Movie(id: 1, title: "Movie 1", overview: "", posterPath: "", releaseDate: "", voteAverage: 0, productionCountries: nil, budget: nil, revenue: nil),
            Movie(id: 2, title: "Movie 2", overview: "", posterPath: "", releaseDate: "", voteAverage: 0, productionCountries: nil, budget: nil, revenue: nil)
        ]
        
        //When
        let useCase = MoviesListUseCase(repo: mockRepo)
        let viewModel = MoviesViewModel(useCase: useCase)
        let movies = await viewModel.getMovies()
        
        //Then
        XCTAssertEqual(movies?[0].id, 1)
        XCTAssertEqual(movies?[1].id, 2)
        
        
        
    }

}
