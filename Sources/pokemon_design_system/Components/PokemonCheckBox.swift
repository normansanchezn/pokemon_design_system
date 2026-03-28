//
//  PokemonCheckBox.swift
//  pokemon_design_system
//
//  Created by Norman Sánchez on 28/03/26.
//

import SwiftUI

public struct PokemonCheckBox: View {
    
    private var isEnabled: Bool
    private var requirement: String
    
    public init(requirement: String, isEnabled: Bool) {
        self.requirement = requirement
        self.isEnabled = isEnabled
    }
    
    public var body: some View {
        
        let chekmarkIcon = if !isEnabled { "checkmark.circle" } else { "checkmark.circle.fill" }
        let checkMarkColor = if !isEnabled { Color.gray.opacity(0.5) } else { Color.green }
        
        HStack {
            Image(systemName: chekmarkIcon)
                .frame(width: 20, height: 20)
                .foregroundStyle(checkMarkColor)
            Text(requirement)
                .foregroundStyle(checkMarkColor)
        }
    }
}

#Preview {
    PokemonCheckBox(requirement: "One Capital Letter", isEnabled: true)
    PokemonCheckBox(requirement: "One Capital Letter", isEnabled: false)
}
