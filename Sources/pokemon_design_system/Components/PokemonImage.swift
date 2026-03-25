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

    public init(pokeUrl: String) {
        self.pokeUrl = pokeUrl
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
        .frame(width: 100, height: 100)
    }
}
