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
    private let action: EmptyAction
    
    public init(
        @ViewBuilder contentView: () -> ContentView,
        backgroundColor: Color = Color.white,
        _ action: @escaping EmptyAction = {}
    ) {
        self.contentView = contentView()
        self.backgroundColor = backgroundColor
        self.action = action
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
        .onTapGesture(perform: {
            action()
        })
    }
}

#Preview {
    PokemonCard {
        Text("Hola")
    }
}
