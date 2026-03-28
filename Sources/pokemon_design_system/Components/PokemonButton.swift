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
    private var isDisabled: Bool
    
    public init(
        buttonText: String,
        style: PokemonButtonStyle,
        action: @escaping () -> Void,
        isDisabled: Bool
    ) {
        self.buttonText = buttonText
        self.style = style
        self.action = action
        self.isDisabled = isDisabled
    }
    
    public var body: some View {
        Button(action: action, label: {
            Text(buttonText)
                .font(theme.typography.headline.bold())
                .foregroundStyle(resolvedForegroundByStyle(style, isDisabled: isDisabled))
        })
        .disabled(isDisabled)
        .padding()
        .frame(maxWidth: .infinity)
        .background {
            Capsule().fill(resolvedColorByStyle(style, isDisabled: isDisabled).opacity(0.3))
                #if os(iOS)
                .glassEffect()
                #endif
        }
        .padding(.horizontal, 20)
    }
}

public extension PokemonButton {
    
    func resolvedForegroundByStyle(_ style: PokemonButtonStyle, isDisabled: Bool) -> Color {
        if isDisabled {
            return Color.gray.opacity(0.8)
        } else {
            switch style {
            case .primary:
                return theme.colors.textPrimary(for: colorScheme)
            case .secondary:
                return theme.colors.textSecondary(for: colorScheme)
            case .tertiary:
                return theme.colors.glassSurface(for: colorScheme)
            }
        }
    }
    
    func resolvedColorByStyle(_ style: PokemonButtonStyle, isDisabled: Bool) -> Color {
        if isDisabled {
            return Color.gray.opacity(0.5)
        } else {
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
}
