//
//  Card.swift
//  Pokedex
//
//  Created by Norman Sánchez on 24/03/26.
//

import SwiftUI

public struct PokemonCard<ContentView: View>: View {
    
    @Environment(\.pokemonTheme) private var theme
    @Environment(\.colorScheme) private var colorScheme
    
    private let contentView: ContentView
    private let backgroundColor: Color?
    private let gradient: LinearGradient?
    private let action: EmptyAction
    private let imageRes: String?
    
    public init(
        @ViewBuilder contentView: () -> ContentView,
        backgroundColor: Color? = nil,
        gradient: LinearGradient? = nil,
        imageRes: String? = nil,
        _ action: @escaping EmptyAction = {}
    ) {
        self.contentView = contentView()
        self.backgroundColor = backgroundColor
        self.gradient = gradient
        self.action = action
        self.imageRes = imageRes
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            contentView
                .padding(.horizontal, theme.layout.cardContentHorizontalPadding)
                .padding(.vertical, theme.layout.cardContentVerticalPadding)
        }
        .background {
            if imageRes != nil {
                Image(imageRes!).resizable().frame(maxWidth: .infinity)
            } else {
                cardBackground
            }
        }
        .onTapGesture(perform: {
            action()
        })
    }
    
    @ViewBuilder
    private var cardBackground: some View {
        let shape = RoundedRectangle(cornerRadius: theme.radius.xl, style: .continuous)

        if let gradient {
            shape
                .fill(gradient)
                .overlay {
                    shape.strokeBorder(
                        theme.colors.glassBorder(for: colorScheme),
                        lineWidth: 1
                    )
                }
        } else {
            shape
                .fill(backgroundColor ?? .white.opacity(0.2))
                .overlay {
                    shape.strokeBorder(
                        theme.colors.glassBorder(for: colorScheme),
                        lineWidth: 1
                    )
                }
        }
    }
}

#Preview {
    PokemonCard(contentView: {
        Text("This is a test content")
    }, gradient: LinearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
}
