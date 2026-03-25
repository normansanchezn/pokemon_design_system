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
    
    public init(@ViewBuilder contentView: () -> ContentView) {
        self.contentView = contentView()
    }
    
    public var body: some View {
        ZStack {
            // Base gradient background
            LinearGradient(
                colors: gradientColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // Animated color blobs
            ZStack {
                blob(color: Color(red: 0.98, green: 0.19, blue: 0.24).opacity(0.35), size: 280)
                    .offset(x: animate ? -120 : -40, y: animate ? -180 : -120)
                blob(color: Color(.systemBlue).opacity(0.30), size: 320)
                    .offset(x: animate ? 140 : 80, y: animate ? 160 : 100)
                blob(color: Color(.systemYellow).opacity(0.25), size: 220)
                    .offset(x: animate ? -30 : -10, y: animate ? 180 : 120)
            }
            .blur(radius: 40)
            .animation(.easeInOut(duration: 8).repeatForever(autoreverses: true), value: animate)
            .allowsHitTesting(false)
            
            // Subtle Poké Ball overlay
            PokeBallOverlay()
                .fill(colorScheme == .dark ? Color.white.opacity(0.05) : Color.black.opacity(0.05))
                .frame(width: 420, height: 420)
                .rotationEffect(.degrees(animate ? 5 : -5))
                .offset(x: animate ? 30 : -10, y: animate ? -20 : 10)
                .blendMode(.overlay)
                .animation(.easeInOut(duration: 10).repeatForever(autoreverses: true), value: animate)
                .allowsHitTesting(false)
            
            // Content on top
            contentView
                .padding(.top, 0)
        }
        .onAppear { animate = true }
    }
    
    // Theme-aware gradient
    private var gradientColors: [Color] {
        if colorScheme == .dark {
            return [Color(red: 0.05, green: 0.07, blue: 0.18), Color(red: 0.10, green: 0.14, blue: 0.32)]
        } else {
            return [Color(red: 0.78, green: 0.88, blue: 1.0), Color.white]
        }
    }
    
    // MARK: - Helpers
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
                .font(.largeTitle.bold())
                .foregroundStyle(.primary)
            Text("Atrapa'los a todos!")
                .font(.headline)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

