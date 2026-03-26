//
//  View+Ext.swift
//  pokemon_design_system
//
//  Created by Norman Sánchez on 24/03/26.
//

import SwiftUI
import pokemon_shared

public extension View {
    func resolvedColorByType(_ type: PokemonType) -> Color {
        switch type {
        case .normal:
            return Color.gray.opacity(0.4)
        case .fighting:
            return Color.red.opacity(0.55)
        case .flying:
            return Color.cyan.opacity(0.4)
        case .poison:
            return Color.purple.opacity(0.4)
        case .ground:
            return Color.brown.opacity(0.45)
        case .rock:
            return Color.orange.opacity(0.35)
        case .bug:
            return Color.blue.opacity(0.4)
        case .dark:
            return Color.black.opacity(0.4)
        case .dragon:
            return Color.orange.opacity(0.4)
        case .fairy:
            return Color.pink.opacity(0.4)
        case .grass:
            return Color.green.opacity(0.4)
        case .fire:
            return Color.red.opacity(0.4)
        case .water:
            return Color.blue.opacity(0.4)
        case .electric:
            return Color.yellow.opacity(0.5)
        case .psychic:
            return Color.pink.opacity(0.55)
        case .ice:
            return Color.cyan.opacity(0.55)
        case .ghost:
            return Color.indigo.opacity(0.45)
        case .steel:
            return Color.gray.opacity(0.55)
        }
    }
}

public extension View {
    func resolvedType(type: PokemonType) -> String {
        switch type {
        case .normal:
            return "Normal"
        case .fighting:
            return "Fighting"
        case .flying:
            return "Flying"
        case .poison:
            return "Poison"
        case .ground:
            return "Ground"
        case .rock:
            return "Rock"
        case .grass:
            return "Grass"
        case .fire:
            return "Fire"
        case .water:
            return "Water"
        case .electric:
            return "Electric"
        case .psychic:
            return "Psychic"
        case .ice:
            return "Ice"
        case .dragon:
            return "Dragon"
        case .dark:
            return "Dark"
        case .bug:
            return "Bug"
        case .ghost:
            return "Ghost"
        case .steel:
            return "Steel"
        case .fairy:
            return "Fairy"
        }
    }
}

public extension View {
    func cardGradient(for types: [PokemonType]) -> LinearGradient {
        let colors = types.prefix(2).map { resolvedColorByType($0).opacity(0.95) }

        switch colors.count {
        case 0:
            return LinearGradient(
                colors: [
                    Color.gray.opacity(0.45),
                    Color.black.opacity(0.15)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case 1:
            return LinearGradient(
                colors: [
                    colors[0],
                    colors[0].opacity(0.35)
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
