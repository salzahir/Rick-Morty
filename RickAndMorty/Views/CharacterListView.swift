//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Salman Z on 1/30/25.
//

import Foundation
import SwiftUI

struct CharacterListView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        List(viewModel.filteredcharacters, id: \.id) { character in
            NavigationLink(character.name, destination: DetailView(viewModel: viewModel, character: character))
        }
        .searchable(text: $viewModel.searchText)
        .navigationTitle("Rick and Morty API")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            do {
                let characters = try await viewModel.fetchCharacters()
                viewModel.characters = characters
                print(characters)
            } catch {
                print("Error fetching characters: \(error)")
            }
        }
    }
}


