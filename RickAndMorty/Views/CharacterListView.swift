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
        List(viewModel.characters, id: \.id) { character in
            NavigationLink(character.name, destination: DetailView(character: character))
        }
        .navigationTitle("Rick and Morty API")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            do {
                if let characters = try? await viewModel.fetchCharacters() {
                    viewModel.characters = characters
                    print(characters)
                }
            }
        }
    }
}


