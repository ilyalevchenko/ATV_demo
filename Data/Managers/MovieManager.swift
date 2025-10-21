//
//  MovieManager.swift
//  ATV_demo
//
//  Created by Ilya Levchenko on 21/10/2025.
//

final class MovieManager: MovieManagerProtocol {
    private let provider: MovieProviderProtocol
    private let cache: MovieCacheProtocol

    init(provider: MovieProviderProtocol, cache: MovieCacheProtocol) {
        self.provider = provider
        self.cache = cache
    }

    func getMovies() async throws -> [Movie] {
        // Check cache first
        if let cachedMovies = cache.getMovies() {
            return cachedMovies
        }

        // Fetch from API
        let movieDTOs = try await provider.fetchMovies()
        let movies = movieDTOs.map { dto in
            Movie(
                id: dto.id,
                title: dto.title,
                overview: dto.overview,
                posterPath: dto.posterPath,
                releaseDate: dto.releaseDate,
                voteAverage: dto.voteAverage
            )
        }

        // Update cache
        cache.saveMovies(movies)
        return movies
    }
}
