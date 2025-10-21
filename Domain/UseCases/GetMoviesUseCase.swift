//
//  GetMoviesUseCase.swift
//  ATV_demo
//
//  Created by Ilya Levchenko on 21/10/2025.
//

final class GetMoviesUseCase: GetMoviesUseCaseProtocol {
    private let manager: MovieManagerProtocol

    init(manager: MovieManagerProtocol) {
        self.manager = manager
    }

    func execute() async throws -> [Movie] {
        return try await manager.getMovies()
    }
}
