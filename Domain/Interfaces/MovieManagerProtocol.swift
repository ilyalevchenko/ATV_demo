//
//  MovieManagerProtocol.swift
//  ATV_demo
//
//  Created by Ilya Levchenko on 21/10/2025.
//

protocol MovieManagerProtocol {
    func getMovies() async throws -> [Movie]
}
