//
//  MovieCache.swift
//  ATV_demo
//
//  Created by Ilya Levchenko on 21/10/2025.
//

import Foundation

protocol MovieCacheProtocol {
    func getMovies() -> [Movie]?
    func saveMovies(_ movies: [Movie])
}

final class MovieCache: MovieCacheProtocol {
    private let cache = NSCache<NSString, NSArray>()
    private let key = "cached_movies"

    func getMovies() -> [Movie]? {
        cache.object(forKey: key as NSString) as? [Movie]
    }

    func saveMovies(_ movies: [Movie]) {
        cache.setObject(movies as NSArray, forKey: key as NSString)
    }
}
