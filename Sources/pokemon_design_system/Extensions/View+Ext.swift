//
//  View+Ext.swift
//  pokemon_design_system
//
//  Created by Norman Sánchez on 24/03/26.
//

import SwiftUI
import pokemon_shared

public extension View {
    func resolvedColorByType(_ type: PokemonType, theme: PokemonTheme = .shared) -> Color {
        theme.pokemonTypePalette.color(for: type)
    }
}

public extension View {
    func resolvedType(type: PokemonType, theme: PokemonTheme = .shared) -> String {
        theme.pokemonTypePalette.label(for: type)
    }
}

public extension View {
    func cardGradient(
        for types: [PokemonType],
        theme: PokemonTheme = .shared,
        colorScheme: ColorScheme = .dark
    ) -> LinearGradient {
        let colors = types.prefix(2).map { resolvedColorByType($0, theme: theme).opacity(0.95) }

        switch colors.count {
        case 0:
            return LinearGradient(
                colors: theme.gradients.neutralCard(for: colorScheme, theme: theme),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case 1:
            return LinearGradient(
                colors: [
                    colors[0],
                    colors[0]
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        default:
            return LinearGradient(
                colors: Array(colors),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
    }
}
