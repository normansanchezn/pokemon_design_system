//
//  PokemonField.swift
//  pokemon_design_system
//
//  Created by Norman Sánchez on 28/03/26.
//

import SwiftUI
import Combine


public struct PokemonFieldModel {
    public let hintText: String
    public let helperText: String
    public var value: Binding<String>
    
    public init(hintText: String, helperText: String, value: Binding<String>) {
        self.hintText = hintText
        self.helperText = helperText
        self.value = value
    }
}

public struct PokemonField: View {
    
    @Environment(\.pokemonTheme) private var theme: PokemonTheme
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    
    public var model: PokemonFieldModel
    
    public init(model: PokemonFieldModel) {
        self.model = model
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(model.helperText)
                .padding(.horizontal, 20)
                .font(theme.typography.caption.bold())
            TextField(
                model.hintText,
                text: model.value
            )
            .padding()
            .textFieldStyle(.plain)
            .background {
                Capsule().fill(theme.colors.fieldBackgroundColor(for: colorScheme))
            }
        }
    }
}

#Preview {
    PokemonBackground {
        VStack(alignment: .leading) {
            let model = PokemonFieldModel(hintText: "Lorem ipsum", helperText: "Lorem ipsum dolor sit amet", value: .constant("Lorem ipsum"))
            PokemonField(model: model)
                .padding(.horizontal, 40)
        }
    }
}
