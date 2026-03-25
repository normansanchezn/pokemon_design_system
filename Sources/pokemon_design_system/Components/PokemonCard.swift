//
//  Card.swift
//  Pokedex
//
//  Created by Norman Sánchez on 24/03/26.
//

import SwiftUI

public struct PokemonCard<ContentView: View>: View {
    
    private let content: ContentView
    
    public init(content: ContentView) {
        self.content = content
    }
    
    public var body: some View {
        VStack {
            content
                .padding()
        }
        .background {
            RoundedRectangle(cornerRadius: 40).fill(
                Color.white.opacity(0.5)
            )
        }
    }
}


#Preview {
    PokemonCard(content: Text("Hola"))
}
