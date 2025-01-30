//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Salman Z on 1/30/25.
//

import Foundation
import SwiftUI

struct CharacterListView: View {
    
    @Binding var characters: [Character]

    var body: some View {
        List(characters, id: \.id) { character in
            NavigationLink(character.name, destination: DetailView(character: character))
        }
        .navigationTitle("Rick and Morty API")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            do {
                if let characters = try? await fetchCharacters() {
                    self.characters = characters
                    print(characters)
                }
            }
        }
    }
}

func fetchCharacters() async throws -> [Character] {
    guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
        print("Error")
        throw URLError(.badURL)
    }
    let (data, _) = try await URLSession.shared.data(from: url)
    let response = try JSONDecoder().decode(CharacterResponse.self, from: data)
    print(response.results)
    return response.results
}
