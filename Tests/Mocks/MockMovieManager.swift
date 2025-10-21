//
//  MockMovieManager.swift
//  ATV_demo
//
//  Created by Ilya Levchenko on 21/10/2025.
//

import XCTest
@testable import ATV_demo

final class MockMovieManager: MovieManagerProtocol {
    var moviesToReturn: [Movie] = []
    var errorToThrow: Error?
    
    func getMovies() async throws -> [Movie] {
        if let error = errorToThrow {
            throw error
        }
        return moviesToReturn
    }
}
