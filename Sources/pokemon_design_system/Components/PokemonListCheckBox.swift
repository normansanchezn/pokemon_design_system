//
//  PokemonListCheckBox.swift
//  pokemon_design_system
//
//  Created by Norman Sánchez on 28/03/26.
//

import SwiftUI

public struct PokemonCheckBoxListModel: Identifiable {
    public let id: UUID = UUID()
    public let requirement: String
    public var isEnabled: Binding<Bool>
    
    public init(requirement: String, isEnabled: Binding<Bool>) {
        self.requirement = requirement
        self.isEnabled = isEnabled
    }
}

public struct PokemonListCheckBox: View {
    
    private let listRequirements: [PokemonCheckBoxListModel]
    
    public init(requirements: [PokemonCheckBoxListModel]) {
        self.listRequirements = requirements
    }
    
    public var body: some View {

        LazyVStack(alignment: .leading) {
            ForEach(listRequirements, id: \.self.id) { requirement in
                PokemonCheckBox(requirement: requirement.requirement, isEnabled: requirement.isEnabled.wrappedValue)
            }
        }
    }
}

#Preview {
    PokemonListCheckBox(requirements: [
        PokemonCheckBoxListModel(requirement: "Lorem ipsum", isEnabled: .constant(true)),
        PokemonCheckBoxListModel(requirement: "Lorem ipsum", isEnabled: .constant(true)),
        PokemonCheckBoxListModel(requirement: "Lorem ipsum", isEnabled: .constant(true)),
        PokemonCheckBoxListModel(requirement: "Lorem ipsum", isEnabled:  .constant(true))
    ])
}
