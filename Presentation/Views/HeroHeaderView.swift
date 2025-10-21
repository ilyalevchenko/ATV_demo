//
//  HeroHeaderView.swift
//  ATV_demo
//
//  Created by Ilya Levchenko on 21/10/2025.
//

import SwiftUI

struct HeroHeaderView: View {
    var body: some View {
        Image("beach_landscape")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .overlay {
                // The view builds the material gradient by filling an area with
                // a material, and then masking that area using a linear
                // gradient.
                Rectangle()
                    .fill(.regularMaterial)
                    .mask {
                        maskView
                    }
            }
            .ignoresSafeArea()
    }

    var maskView: some View {
        LinearGradient(
            stops: [
                .init(color: .black, location: 0.25),
                .init(color: .black.opacity(0.7), location: 0.375),
                .init(color: .black.opacity(0), location: 0.5),
            ],
            startPoint: .bottom, endPoint: .top
        )
    }
}
