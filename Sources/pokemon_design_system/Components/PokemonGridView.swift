import SwiftUI
import pokemon_shared

public struct PokemonGridView: View {
    private let pokemons: [Pokemon]
    private let onItemAppear: ((Pokemon) -> Void)?
    private let action: (Pokemon) -> Void
    @Environment(\.pokemonTheme) private var theme
    @Environment(\.colorScheme) private var colorScheme
    
    public init(
        pokemons: [Pokemon],
        onItemAppear: ((Pokemon) -> Void)? = nil,
        action: @escaping (Pokemon) -> Void
    ) {
        self.pokemons = pokemons
        self.onItemAppear = onItemAppear
        self.action = action
    }
    
    public var body: some View {
        LazyVGrid(
            columns: Array(
            repeating: GridItem(
                .flexible(),
                    spacing: theme.layout.gridSpacing
                ),
                count: 3
            ),
            spacing: theme.layout.gridSpacing
        ) {
            ForEach(
                pokemons,
                id: \.id
            ) { pokemon in
                PokemonCard(contentView: {
                    gridItem(pokemon)
                }, backgroundColor: .clear)
                .background {
                    RoundedRectangle(cornerRadius: theme.radius.xl)
                        .fill(cardGradient(for: pokemon.types, theme: theme, colorScheme: colorScheme))
                }
                .onAppear {
                    onItemAppear?(pokemon)
                }
            }
        }
        .padding(.horizontal, theme.layout.gridHorizontalPadding)
    }
    
    // MARK: - Item Views
    private func gridItem(_ pokemon: Pokemon) -> some View {
        VStack(spacing: theme.spacing.sm) {
            PokemonImage(pokeUrl: pokemon.url)
                .onTapGesture {
                    action(pokemon)
            }
            Text(pokemon.name.capitalized)
                .font(theme.typography.headline)
                .foregroundStyle(theme.colors.textPrimary(for: colorScheme))
                .shadow(color: theme.colors.textMuted(for: colorScheme).opacity(0.25), radius: 1, x: 0, y: 1)
            ListPokemonType(pokeTypes: pokemon.types)
        }
        .frame(maxWidth: .infinity)
    }
}
