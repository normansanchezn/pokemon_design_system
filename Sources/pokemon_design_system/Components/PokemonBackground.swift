//
//  Background.swift
//  Pokedex
//
//  Created by Norman Sánchez on 24/03/26.
//

import SwiftUI

public struct PokemonBackground<ContentView: View>: View {
    
    private let contentView: ContentView
    @State private var animate: Bool = false
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.pokemonTheme) private var theme
    
    public init(@ViewBuilder contentView: () -> ContentView) {
        self.contentView = contentView()
    }
    
    public var body: some View {
        ZStack {
            LinearGradient(
                colors: theme.gradients.appBackground(for: colorScheme, theme: theme),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ZStack {
                blob(color: theme.colors.brandRed.opacity(0.35), size: 280)
                    .offset(x: animate ? -120 : -40, y: animate ? -180 : -120)
                blob(color: theme.colors.brandBlue.opacity(0.30), size: 320)
                    .offset(x: animate ? 140 : 80, y: animate ? 160 : 100)
                blob(color: theme.colors.brandYellow.opacity(0.25), size: 220)
                    .offset(x: animate ? -30 : -10, y: animate ? 180 : 120)
            }
            .blur(radius: 40)
            .animation(.easeInOut(duration: 8).repeatForever(autoreverses: true), value: animate)
            .allowsHitTesting(false)
            
            PokeBallOverlay()
                .fill(theme.colors.pokeballOverlay(for: colorScheme))
                .frame(width: 420, height: 420)
                .rotationEffect(.degrees(animate ? 5 : -5))
                .offset(x: animate ? 30 : -10, y: animate ? -20 : 10)
                .blendMode(.overlay)
                .animation(.easeInOut(duration: 10).repeatForever(autoreverses: true), value: animate)
                .allowsHitTesting(false)
            
            contentView
                .padding(.top, 0)
        }
        .onAppear { animate = true }
    }

    private func blob(color: Color, size: CGFloat) -> some View {
        Circle()
            .fill(color)
            .frame(width: size, height: size)
            .scaleEffect(animate ? 1.1 : 0.95)
            .animation(.easeInOut(duration: 6).repeatForever(autoreverses: true), value: animate)
    }
}

// MARK: - Poké Ball Shape
private struct PokeBallOverlay: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        
        // Outer circle
        path.addEllipse(in: CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2))
        
        // Horizontal band
        let bandHeight = radius * 0.22
        let bandRect = CGRect(x: center.x - radius, y: center.y - bandHeight/2, width: radius * 2, height: bandHeight)
        path.addRect(bandRect)
        
        // Center circle (button)
        let innerRadius = radius * 0.22
        path.addEllipse(in: CGRect(x: center.x - innerRadius, y: center.y - innerRadius, width: innerRadius * 2, height: innerRadius * 2))
        
        return path
    }
}
// MARK: - Preview
#Preview("PokemonBackground") {
    PokemonBackground {
    VStack(spacing: 16) {
        Text("Pokedex")
            .font(PokemonTheme.shared.typography.hero)
            .foregroundStyle(PokemonTheme.shared.colors.textPrimary(for: .dark))
        Text("Atrapa'los a todos!")
            .font(PokemonTheme.shared.typography.headline)
            .foregroundStyle(PokemonTheme.shared.colors.textSecondary(for: .dark))
    }
    .padding()
}
}
