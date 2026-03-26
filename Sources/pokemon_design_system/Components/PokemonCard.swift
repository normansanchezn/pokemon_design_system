//
//  Card.swift
//  Pokedex
//
//  Created by Norman Sánchez on 24/03/26.
//

import SwiftUI

public struct PokemonCard<ContentView: View>: View {
    
    private let contentView: ContentView
    private let backgroundColor: Color?
    private let action: EmptyAction
    @Environment(\.pokemonTheme) private var theme
    @Environment(\.colorScheme) private var colorScheme
    
    public init(
        @ViewBuilder contentView: () -> ContentView,
        backgroundColor: Color? = nil,
        _ action: @escaping EmptyAction = {}
    ) {
        self.contentView = contentView()
        self.backgroundColor = backgroundColor
        self.action = action
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            contentView
                .padding(.horizontal, theme.layout.cardContentHorizontalPadding)
                .padding(.vertical, theme.layout.cardContentVerticalPadding)
        }
        .background {
            let fillColor = backgroundColor ?? theme.colors.glassSurface(for: colorScheme)

            RoundedRectangle(cornerRadius: theme.radius.xl, style: .continuous)
                .fill(fillColor)
                .overlay {
                    RoundedRectangle(cornerRadius: theme.radius.xl, style: .continuous)
                        .strokeBorder(
                            theme.colors.glassBorder(for: colorScheme),
                            lineWidth: 1
                        )
                }
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
