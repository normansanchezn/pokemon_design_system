//
//  PokeImage.swift
//  Pokedex
//
//  Created by Norman Sánchez on 24/03/26.
//

import SwiftUI
import SDWebImageSwiftUI

public struct PokemonImage: View {
    public let pokeUrl: String
    public let size: CGFloat

    public init(pokeUrl: String, size: CGFloat = 70) {
        self.pokeUrl = pokeUrl
        self.size = size
    }

    public var body: some View {
        WebImage(
            url: URL(
                string: pokeUrl
            )
        ) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                Color.clear
            case .empty:
                ProgressView()
            @unknown default:
                Color.clear
            }
        }
        .frame(width: size, height: size)
    }
}
