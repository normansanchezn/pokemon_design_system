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
        case .bug:
            return Color.blue.opacity(0.4)
        case .dark:
            return Color.black.opacity(0.4)
        case .dragon:
            return Color.orange.opacity(0.4)
        case .fairy:
            return Color.pink.opacity(0.4)
        case .weed:
            return Color.green.opacity(0.4)
        case .poison:
            return Color.purple.opacity(0.4)
        case .fire:
            return Color.red.opacity(0.4)
        case .water:
            return Color.blue.opacity(0.4)
        default:
            return Color.black.opacity(0.4)
        }
    }
}

public extension View {
    func resolvedType(type: PokemonType) -> String {
        switch type {
        case .weed:
            return "Grass"
        case .fire:
            return "Fire"
        case .water:
            return "Water"
        case .earth:
            return "Ground"
        case .poison:
            return "Poison"
        case .dragon:
            return "Dragon"
        default:
            return ""
        }
    }
}
