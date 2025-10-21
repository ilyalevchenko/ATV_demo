//
//  MovieListViewModel.swift
//  ATV_demo
//
//  Created by Ilya Levchenko on 21/10/2025.
//

import Foundation
import Combine

final class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    @Published var error: String?

    private let useCase: GetMoviesUseCaseProtocol

    init(useCase: GetMoviesUseCaseProtocol) {
        self.useCase = useCase
    }

    @MainActor
    func onAppear() async {
        isLoading = true
        error = nil

        do {
            movies = try await useCase.execute()
        } catch {
            self.error = error.localizedDescription
        }

        isLoading = false
    }
}
