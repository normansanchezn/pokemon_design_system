import SwiftUI
import pokemon_shared

public struct PokemonGridView: View {
    private let pokemons: [Pokemon]
    private let action: (Pokemon) -> Void
    
    public init(pokemons: [Pokemon], action: @escaping (Pokemon) -> Void) {
        self.pokemons = pokemons
        self.action = action
    }
    
    public var body: some View {
        LazyVGrid(
            columns: Array(
                repeating: GridItem(
                    .flexible(),
                    spacing: 12
                ),
                count: 3
            ),
            spacing: 12
        ) {
            ForEach(
                pokemons,
                id: \.id
            ) { pokemon in
                PokemonCard(contentView: {
                    gridItem(pokemon)
                }, backgroundColor: .clear)
                .background {
                    RoundedRectangle(cornerRadius: 40)
                        .fill(cardGradient(for: pokemon.types))
                }
            }
        }
        .padding(.horizontal, 8)
    }
    
    // MARK: - Item Views
    private func gridItem(_ pokemon: Pokemon) -> some View {
        VStack(spacing: 8) {
            PokemonImage(pokeUrl: pokemon.url)
                .onTapGesture {
                    action(pokemon)
                }
            Text(pokemon.name.capitalized)
                .font(.headline)
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.2), radius: 1, x: 0, y: 1)
            ListPokemonType(pokeTypes: pokemon.types)
        }
        .frame(maxWidth: .infinity)
    }
}
