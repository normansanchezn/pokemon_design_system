//
//  PokemonSubTitle.swift
//  pokemon_design_system
//
//  Created by Norman Sánchez on 27/03/26.
//

import SwiftUI

public struct PokemonSubTitle: View {
    
    @Environment(\.pokemonTheme) private var theme: PokemonTheme
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    public let subtitle: String
    
    public init(subtitle: String) {
        self.subtitle = subtitle
    }
    
    public var body: some View {
        Text(subtitle)
            .font(theme.typography.subtitle.bold())
            .foregroundStyle(theme.colors.textSecondary(for: colorScheme))
    }
}
