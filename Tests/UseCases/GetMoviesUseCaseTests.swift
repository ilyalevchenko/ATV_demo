//
//  GetMoviesUseCaseTests.swift
//  ATV_demo
//
//  Created by Ilya Levchenko on 21/10/2025.
//


import XCTest
@testable import ATV_demo

@MainActor
final class GetMoviesUseCaseTests: XCTestCase {
    private var mockMovieManager: MockMovieManager!
    private var getMoviesUseCase: GetMoviesUseCase!
    
    override func setUp() {
        super.setUp()
        mockMovieManager = MockMovieManager()
        getMoviesUseCase = GetMoviesUseCase(manager: mockMovieManager)
    }
    
    override func tearDown() {
        mockMovieManager = nil
        getMoviesUseCase = nil
        super.tearDown()
    }
    
    // Test successful movie retrieval
    func testGetMoviesSuccess() async {
        // Given
        let expectedMovies = [
            Movie(
                id: 1,
                title: "Test Movie 1",
                overview: "Test Overview 1",
                posterPath: "/test1.jpg",
                releaseDate: "2023-01-01",
                voteAverage: 8.5
            ),
            Movie(
                id: 2,
                title: "Test Movie 2", 
                overview: "Test Overview 2",
                posterPath: "/test2.jpg",
                releaseDate: "2023-02-01",
                voteAverage: 7.8
            )
        ]
        mockMovieManager.moviesToReturn = expectedMovies
        
        do {
            // When
            let movies = try await getMoviesUseCase.execute()
            
            // Then
            XCTAssertEqual(movies.count, 2)
            XCTAssertEqual(movies[0].title, "Test Movie 1")
            XCTAssertEqual(movies[1].title, "Test Movie 2")
            XCTAssertEqual(movies[0].voteAverage, 8.5)
        } catch {
            XCTFail("Expected success but got error: \(error)")
        }
    }
    
    // Test error handling
    func testGetMoviesFailure() async {
        // Given
        let expectedError = NSError(domain: "TestError", code: 1, userInfo: nil)
        mockMovieManager.errorToThrow = expectedError
        
        do {
            // When
            _ = try await getMoviesUseCase.execute()
            XCTFail("Expected error but got success")
        } catch {
            // Then
            XCTAssertEqual((error as NSError).domain, "TestError")
            XCTAssertEqual((error as NSError).code, 1)
        }
    }
    
    // Test empty movie list
    func testGetMoviesEmpty() async {
        // Given
        mockMovieManager.moviesToReturn = []
        
        do {
            // When
            let movies = try await getMoviesUseCase.execute()
            
            // Then
            XCTAssertTrue(movies.isEmpty)
        } catch {
            XCTFail("Expected empty array but got error: \(error)")
        }
    }
}
