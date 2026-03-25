//
//  Card.swift
//  Pokedex
//
//  Created by Norman Sánchez on 24/03/26.
//

import SwiftUI

public struct PokemonCard<ContentView: View>: View {
    
    private let contentView: ContentView
    private let backgroundColor: Color
    
    public init(@ViewBuilder contentView: () -> ContentView, backgroundColor: Color = Color.white) {
        self.contentView = contentView()
        self.backgroundColor = backgroundColor
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            contentView
                .padding(.horizontal, 8)
                .padding(.vertical, 16)
        }
        .background {
            RoundedRectangle(cornerRadius: 40).fill(
                backgroundColor.opacity(0.5)
            )
        }
    }
}

#Preview {
    PokemonCard {
        Text("Hola")
    }
}
