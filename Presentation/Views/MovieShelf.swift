//
//  MovieShelf.swift
//  ATV_demo
//
//  Created by Ilya Levchenko on 21/10/2025.
//

import SwiftUI

struct MovieShelf: View {
    let movies: [Movie]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 40) {
                ForEach(movies) { movie in

                    Button {} label: {
                        VStack(spacing: 8) {
                            AsyncImage(url: movie.posterURL) { phase in
                                switch phase {
                                case .empty:
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.3))
                                        .aspectRatio(2 / 3, contentMode: .fit)
                                case let .success(image):
                                    image
                                        .resizable()
                                        .aspectRatio(2 / 3, contentMode: .fill)
                                case .failure:
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.3))
                                        .overlay(
                                            Image(systemName: "photo")
                                                .foregroundColor(.white)
                                        )
                                @unknown default:
                                    EmptyView()
                                }
                            }

                            Text(movie.title)
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                        .containerRelativeFrame(.horizontal, count: 6, spacing: 40)
                    } // BUTTON LABEL
                } // FOREACH
            } // LAZYHSTACK
        } // SCROLLVIEW
        .scrollClipDisabled()
        .buttonStyle(.borderless)
    }
}
