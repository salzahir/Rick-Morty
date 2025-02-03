//
//  ViewModel.swift
//  RickAndMorty
//
//  Created by Salman Z on 2/2/25.
//
import SwiftUI

class ViewModel: ObservableObject {
    @Published var characters: [Character]  = []
    
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
    
}
