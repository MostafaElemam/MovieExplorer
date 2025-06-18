//
//  MoviesListUseCaseTests.swift
//  MovieExplorerTests
//
//  Created by Mostafa Elemam on 18/06/2025.
//

import XCTest
@testable import MovieExplorer

final class MoviesListUseCaseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func test_MoviesListUseCase_execute_returnsMovies() async {
        //Given
        let mockRepo = MockMoviesRepository()
        mockRepo.mockMovies = [
            Movie(id: 1, title: "Movie 1", overview: "", posterPath: "", releaseDate: "", voteAverage: 0, productionCountries: nil, budget: nil, revenue: nil),
            Movie(id: 2, title: "Movie 2", overview: "", posterPath: "", releaseDate: "", voteAverage: 0, productionCountries: nil, budget: nil, revenue: nil)
        ]
        //When
        let useCase = MoviesListUseCase(repo: mockRepo)
        let movies = await useCase.execute()
        
        //Then
        XCTAssertEqual(movies?.count, 2)
        XCTAssertEqual(movies?.first?.title, "Movie 1")
        
    }
    
    

}
