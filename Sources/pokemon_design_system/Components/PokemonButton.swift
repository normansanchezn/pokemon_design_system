//
//  PokemonButton.swift
//  pokemon_design_system
//
//  Created by Norman Sánchez on 27/03/26.
//

import SwiftUI

public enum PokemonButtonStyle {
    case primary
    case secondary
    case tertiary
}

public struct PokemonButton: View {
    
    @Environment(\.pokemonTheme) private var theme: PokemonTheme
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    
    private let buttonText: String
    private let action: () -> Void
    private let style: PokemonButtonStyle
    
    public init(
        buttonText: String,
        style: PokemonButtonStyle,
        action: @escaping () -> Void
    ) {
        self.buttonText = buttonText
        self.style = style
        self.action = action
    }
    
    public var body: some View {
        Button(action: action, label: {
            Text(buttonText)
                .font(theme.typography.headline.bold())
                .foregroundStyle(resolvedForegroundByStyle(style))
        })
        .padding()
        .frame(maxWidth: .infinity)
        .background {
            Capsule().fill(resolvedColorByStyle(style).opacity(0.3))
                .glassEffect()
        }
        .padding(20)
        .padding(.bottom, 20)
    }
}

public extension PokemonButton {
    
    func resolvedForegroundByStyle(_ style: PokemonButtonStyle) -> Color {
        switch style {
        case .primary:
            theme.colors.textPrimary(for: colorScheme)
        case .secondary:
            theme.colors.textSecondary(for: colorScheme)
        case .tertiary:
            theme.colors.glassSurface(for: colorScheme)
        }
    }
    func resolvedColorByStyle(_ style: PokemonButtonStyle) -> Color {
        switch style {
        case .primary:
            return theme.colors.brandBlue
        case .secondary:
            return Color.purple
        case .tertiary:
            return Color.orange
        }
    }
}
