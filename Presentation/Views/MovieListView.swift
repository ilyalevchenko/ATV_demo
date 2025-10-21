//
//  MovieListView.swift
//  ATV_demo
//
//  Created by Ilya Levchenko on 21/10/2025.
//

import SwiftUI

struct MovieListView: View {
    @StateObject var viewModel: MovieListViewModel

    init(viewModel: MovieListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 26) {
                    headerView

                    // Popular Movies Shelf
                    Section("Popular Movies") {
                        MovieShelf(movies: viewModel.movies)
                    }

                    // Trending Now Shelf
                    Section("Trending Now") {
                        MovieShelf(movies: Array(viewModel.movies.shuffled().prefix(10)))
                    }
                }
                .scrollTargetLayout()
            }
            .background(alignment: .top) {
                HeroHeaderView()
            }
            .scrollClipDisabled()
            .frame(maxHeight: .infinity, alignment: .top)
            .onAppear {
                Task {
                    await viewModel.onAppear()
                }
            }
        }
    }

    var headerView: some View {
        VStack(alignment: .leading) {
            Text("MovieStream")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)

            Spacer()

            HStack {
                Button("Play") {}
                    .buttonStyle(.borderedProminent)

                Button("My List") {}
                    .buttonStyle(.bordered)
            }
            .padding(.bottom, 80)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .focusSection()
        .containerRelativeFrame(.vertical, alignment: .topLeading) { length, _ in
            length * 0.7
        }
    }
}
