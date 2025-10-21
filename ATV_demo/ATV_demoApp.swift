//
//  ATV_demoApp.swift
//  ATV_demo
//
//  Created by Ilya Levchenko on 21/10/2025.
//

import SwiftUI

@main
struct ATV_demoApp: App {
    private let container = DIContainer()

    var body: some Scene {
        WindowGroup {
            MovieListView(viewModel: container.makeMovieListViewModel())
        }
    }
}
