//
//  Background.swift
//  Pokedex
//
//  Created by Norman Sánchez on 24/03/26.
//

import SwiftUI

public struct PokemonBackground<ContentView: View>: View {
    
    private let contentView: ContentView
    
    public init(@ViewBuilder contentView: () -> ContentView) {
        self.contentView = contentView()
    }
    
    public var body: some View {
        ZStack {
            LinearGradient(
                colors: gradientColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).ignoresSafeArea()
            contentView
        }
    }
    
    
    private var gradientColors: [Color] {
        [Color(.blue), Color(.white)]
    }
}

