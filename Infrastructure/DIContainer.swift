//
//  DIContainer.swift
//  ATV_demo
//
//  Created by Ilya Levchenko on 21/10/2025.
//

import Foundation

final class DIContainer {
    let movieProvider: MovieProviderProtocol
    let movieCache: MovieCacheProtocol
    let movieManager: MovieManagerProtocol
    let getMoviesUseCase: GetMoviesUseCaseProtocol

    init() {
        self.movieProvider = MovieProvider()
        self.movieCache = MovieCache()
        self.movieManager = MovieManager(provider: movieProvider, cache: movieCache)
        self.getMoviesUseCase = GetMoviesUseCase(manager: movieManager)
    }

    func makeMovieListViewModel() -> MovieListViewModel {
        MovieListViewModel(useCase: getMoviesUseCase)
    }
}
