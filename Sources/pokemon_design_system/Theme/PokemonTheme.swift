//
//  PokemonTheme.swift
//  pokemon_design_system
//
//  Created by Codex on 26/03/26.
//

import SwiftUI
import Foundation
import pokemon_shared

public struct PokemonTheme: @unchecked Sendable {
    public let colors: Colors
    public let spacing: Spacing
    public let radius: Radius
    public let sizes: Sizes
    public let typography: Typography
    public let layout: Layout
    public let gradients: Gradients
    public let pokemonTypePalette: PokemonTypePalette

    public init(
        colors: Colors = Colors(),
        spacing: Spacing = Spacing(),
        radius: Radius = Radius(),
        sizes: Sizes = Sizes(),
        typography: Typography = Typography(),
        layout: Layout = Layout(),
        gradients: Gradients = Gradients(),
        pokemonTypePalette: PokemonTypePalette = PokemonTypePalette()
    ) {
        self.colors = colors
        self.spacing = spacing
        self.radius = radius
        self.sizes = sizes
        self.typography = typography
        self.layout = layout
        self.gradients = gradients
        self.pokemonTypePalette = pokemonTypePalette
    }

    public static let shared = PokemonTheme()

    public func formattedPokemonNumber(_ id: Int) -> String {
        "#\(String(format: "%03d", id))"
    }
}

public extension PokemonTheme {
    struct Colors {
        public let brandRed = Color(red: 0.98, green: 0.19, blue: 0.24)
        public let brandBlue = Color(red: 0.10, green: 0.45, blue: 0.93)
        public let brandYellow = Color(red: 0.97, green: 0.80, blue: 0.16)

        public let backgroundDarkStart = Color(red: 0.05, green: 0.07, blue: 0.18)
        public let backgroundDarkEnd = Color(red: 0.10, green: 0.14, blue: 0.32)
        public let backgroundLightStart = Color(red: 0.96, green: 0.98, blue: 1.00)
        public let backgroundLightEnd = Color(red: 0.88, green: 0.93, blue: 0.99)

        public let pokeballOverlayDark = Color.white.opacity(0.05)
        public let pokeballOverlayLight = Color.black.opacity(0.05)

        public let glassSurfaceDark = Color.white.opacity(0.12)
        public let glassSurfaceLight = Color.white.opacity(0.72)
        public let glassSurfaceStrongDark = Color.white.opacity(0.18)
        public let glassSurfaceStrongLight = Color.white.opacity(0.86)
        public let glassBorderDark = Color.white.opacity(0.16)
        public let glassBorderLight = Color.black.opacity(0.08)

        public let textPrimaryDark = Color(red: 0.98, green: 0.99, blue: 1.00)
        public let textSecondaryDark = Color(red: 0.82, green: 0.86, blue: 0.95)
        public let textMutedDark = Color(red: 0.64, green: 0.71, blue: 0.86)

        public let textPrimaryLight = Color(red: 0.08, green: 0.12, blue: 0.24)
        public let textSecondaryLight = Color(red: 0.26, green: 0.31, blue: 0.43)
        public let textMutedLight = Color(red: 0.45, green: 0.50, blue: 0.61)

        public let textOnTint = Color.white

        public let neutralGradientStartDark = Color.gray.opacity(0.45)
        public let neutralGradientEndDark = Color.black.opacity(0.15)
        public let neutralGradientStartLight = Color(red: 0.74, green: 0.82, blue: 0.93)
        public let neutralGradientEndLight = Color(red: 0.60, green: 0.69, blue: 0.84)

        public init() {}

        public func pageBackground(for colorScheme: ColorScheme) -> [Color] {
            if colorScheme == .dark {
                return [backgroundDarkStart, backgroundDarkEnd]
            } else {
                return [backgroundLightStart, backgroundLightEnd]
            }
        }

        public func glassSurface(for colorScheme: ColorScheme) -> Color {
            colorScheme == .dark ? glassSurfaceDark : glassSurfaceLight
        }

        public func glassSurfaceStrong(for colorScheme: ColorScheme) -> Color {
            colorScheme == .dark ? glassSurfaceStrongDark : glassSurfaceStrongLight
        }

        public func glassBorder(for colorScheme: ColorScheme) -> Color {
            colorScheme == .dark ? glassBorderDark : glassBorderLight
        }

        public func textPrimary(for colorScheme: ColorScheme) -> Color {
            colorScheme == .dark ? textPrimaryDark : textPrimaryLight
        }

        public func textSecondary(for colorScheme: ColorScheme) -> Color {
            colorScheme == .dark ? textSecondaryDark : textSecondaryLight
        }

        public func textMuted(for colorScheme: ColorScheme) -> Color {
            colorScheme == .dark ? textMutedDark : textMutedLight
        }

        public func neutralGradient(for colorScheme: ColorScheme) -> [Color] {
            if colorScheme == .dark {
                return [neutralGradientStartDark, neutralGradientEndDark]
            } else {
                return [neutralGradientStartLight, neutralGradientEndLight]
            }
        }

        public func pokeballOverlay(for colorScheme: ColorScheme) -> Color {
            colorScheme == .dark ? pokeballOverlayDark : pokeballOverlayLight
        }
    }

    struct Spacing {
        public let xxs: CGFloat = 4
        public let xs: CGFloat = 8
        public let sm: CGFloat = 12
        public let md: CGFloat = 16
        public let lg: CGFloat = 20
        public let xl: CGFloat = 24
        public let xxl: CGFloat = 32
        public let xxxl: CGFloat = 40

        public init() {}
    }

    struct Radius {
        public let sm: CGFloat = 12
        public let md: CGFloat = 20
        public let lg: CGFloat = 28
        public let xl: CGFloat = 40
        public let pill: CGFloat = 999

        public init() {}
    }

    struct Sizes {
        public let loader: CGFloat = 100
        public let pokemonSprite: CGFloat = 70
        public let pokemonSpriteDetail: CGFloat = 200
        public let searchFieldHeight: CGFloat = 52

        public init() {}
    }

    struct Typography {
        public let hero = Font.largeTitle.bold()
        public let title = Font.title.bold()
        public let headline = Font.headline
        public let subtitle = Font.subheadline
        public let body = Font.body
        public let caption = Font.caption
        public let calloutBold = Font.callout.bold()

        public init() {}
    }

    struct Layout {
        public let screenHorizontalPadding: CGFloat = 20
        public let contentHorizontalPadding: CGFloat = 16
        public let gridHorizontalPadding: CGFloat = 8
        public let gridSpacing: CGFloat = 12
        public let headerSpacing: CGFloat = 14
        public let contentTopSpacing: CGFloat = 190
        public let cardContentHorizontalPadding: CGFloat = 8
        public let cardContentVerticalPadding: CGFloat = 16
        public let searchFieldHorizontalPadding: CGFloat = 16
        public let searchFieldVerticalPadding: CGFloat = 12

        public init() {}
    }

    struct Gradients {
        public func appBackground(for colorScheme: ColorScheme, theme: PokemonTheme = .shared) -> [Color] {
            theme.colors.pageBackground(for: colorScheme)
        }

        public func neutralCard(for colorScheme: ColorScheme, theme: PokemonTheme = .shared) -> [Color] {
            theme.colors.neutralGradient(for: colorScheme)
        }

        public init() {}
    }

    struct PokemonTypePalette {
        public func color(for type: PokemonType) -> Color {
            switch type {
            case .normal:
                return Color.gray.opacity(0.4)
            case .fighting:
                return Color.red.opacity(0.55)
            case .flying:
                return Color.cyan.opacity(0.4)
            case .poison:
                return Color.purple.opacity(0.4)
            case .ground:
                return Color.brown.opacity(0.45)
            case .rock:
                return Color.orange.opacity(0.35)
            case .bug:
                return Color.blue.opacity(0.4)
            case .dark:
                return Color.black.opacity(0.4)
            case .dragon:
                return Color.orange.opacity(0.4)
            case .fairy:
                return Color.pink.opacity(0.4)
            case .grass:
                return Color.green.opacity(0.4)
            case .fire:
                return Color.red.opacity(0.4)
            case .water:
                return Color.blue.opacity(0.4)
            case .electric:
                return Color.yellow.opacity(0.5)
            case .psychic:
                return Color.pink.opacity(0.55)
            case .ice:
                return Color.cyan.opacity(0.55)
            case .ghost:
                return Color.indigo.opacity(0.45)
            case .steel:
                return Color.gray.opacity(0.55)
            }
        }

        public func label(for type: PokemonType) -> String {
            switch type {
            case .normal:
                return "Normal"
            case .fighting:
                return "Fighting"
            case .flying:
                return "Flying"
            case .poison:
                return "Poison"
            case .ground:
                return "Ground"
            case .rock:
                return "Rock"
            case .grass:
                return "Grass"
            case .fire:
                return "Fire"
            case .water:
                return "Water"
            case .electric:
                return "Electric"
            case .psychic:
                return "Psychic"
            case .ice:
                return "Ice"
            case .dragon:
                return "Dragon"
            case .dark:
                return "Dark"
            case .bug:
                return "Bug"
            case .ghost:
                return "Ghost"
            case .steel:
                return "Steel"
            case .fairy:
                return "Fairy"
            }
        }

        public init() {}
    }
}

private struct PokemonThemeKey: EnvironmentKey {
    static let defaultValue = PokemonTheme.shared
}

public extension EnvironmentValues {
    var pokemonTheme: PokemonTheme {
        get { self[PokemonThemeKey.self] }
        set { self[PokemonThemeKey.self] = newValue }
    }
}

public extension View {
    func pokemonTheme(_ theme: PokemonTheme) -> some View {
        environment(\.pokemonTheme, theme)
    }
}
