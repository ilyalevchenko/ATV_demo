//
//  GetMoviesUseCaseProtocol.swift
//  ATV_demo
//
//  Created by Ilya Levchenko on 21/10/2025.
//

protocol GetMoviesUseCaseProtocol {
    func execute() async throws -> [Movie]
}
