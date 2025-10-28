//
//  MovieProvider.swift
//  ATV_demo
//
//  Created by Ilya Levchenko on 21/10/2025.
//

import Foundation

protocol MovieProviderProtocol {
    func fetchMovies() async throws -> [MovieDTO]
}

final class MovieProvider: MovieProviderProtocol {
    private let apiKey = "9df1890714b7821d692d2e1b904643f5" 
    private let baseURL = "https://api.themoviedb.org/3"

    func fetchMovies() async throws -> [MovieDTO] {
        guard let url = URL(string: "\(baseURL)/movie/popular?api_key=\(apiKey)") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(MovieResponse.self, from: data)
        return response.results
    }
}
