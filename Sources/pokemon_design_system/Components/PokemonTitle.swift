//
//  PokemonTitle.swift
//  pokemon_design_system
//
//  Created by Norman Sánchez on 27/03/26.
//

import SwiftUI

public struct PokemonTitle: View {
    
    @Environment(\.pokemonTheme) private var theme: PokemonTheme
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    private let title: String
    
    public init(title: String) {
        self.title = title
    }
    
    public var body: some View {
        Text(title)
            .font(theme.typography.hero.bold())
            .foregroundStyle(theme.colors.textPrimary(for: colorScheme))
    }
}
