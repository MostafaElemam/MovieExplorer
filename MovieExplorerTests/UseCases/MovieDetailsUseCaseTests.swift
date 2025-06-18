//
//  MovieDetailsUseCaseTests.swift
//  MovieExplorerTests
//
//  Created by Mostafa Elemam on 18/06/2025.
//

import XCTest
@testable import MovieExplorer

final class MovieDetailsUseCaseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func test_MovieDetailsUseCase_execute_returnsMovie() async {
        //Given
        let mockRepo = MockMoviesRepository()
        mockRepo.mockMovie =
            Movie(id: 1, title: "Movie 1", overview: "", posterPath: "", releaseDate: "", voteAverage: 0, productionCountries: nil, budget: nil, revenue: nil)
        //When
        let useCase = MovieDetailsUseCase(repo: mockRepo)
        let movie = await useCase.execute(for: 1)
        
        //Then
        XCTAssertEqual(movie?.id, 1)
        XCTAssertNotNil(movie)
        
    }

}
