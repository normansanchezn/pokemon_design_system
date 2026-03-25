//
//  PokeListType.swift
//  Pokedex
//
//  Created by Norman Sánchez on 24/03/26.
//

import SwiftUI
import pokemon_shared

public struct ListPokemonType: View {
    
    public let pokeTypes: [PokemonType]
    
    public init(pokeTypes: [PokemonType]) {
        self.pokeTypes = pokeTypes
    }
    
    public var body: some View {
        HStack {
            ForEach(pokeTypes.indices, id: \.self) { index in
                Text(resolvedType(type: pokeTypes[index]))
                    .padding(.horizontal, 12)
                    .background{
                        if #available(macOS 26.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *) {
                            Capsule()
                                .fill(
                                    resolvedColorByType(pokeTypes[index])
                                )
                                .glassEffect()
                        } else {
                            Capsule()
                                .fill(
                                    resolvedColorByType(pokeTypes[index])
                                )
                        }
                    }
            }
        }
    }
}
