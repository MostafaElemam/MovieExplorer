//
//  MovieDetailsViewModelTests.swift
//  MovieExplorerTests
//
//  Created by Mostafa Elemam on 19/06/2025.
//

import XCTest
@testable import MovieExplorer

final class MovieDetailsViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_MovieDetailsViewModel_getMovieById_returnsMovie() async {
        //Given
        let mockRepo = MockMoviesRepository()
        mockRepo.mockMovie = Movie(id: 2, title: "Movie 2", overview: "", posterPath: "", releaseDate: "", voteAverage: 0, productionCountries: nil, budget: nil, revenue: nil)
        
        //When
        let useCase = MovieDetailsUseCase(repo: mockRepo)
        let viewModel = MovieDetailsViewModel(useCase: useCase)
        let movie = await viewModel.getMovie(2)
        
        //Then
        XCTAssertEqual(movie?.title, "Movie 2")
    }

}
