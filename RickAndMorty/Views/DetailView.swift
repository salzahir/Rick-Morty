//
//  DetailView.swift
//  RickAndMorty
//
//  Created by Salman Z on 1/30/25.
//

import Foundation
import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel: ViewModel
    var character: Character
    
    @State var showEpisodes: Bool = false
    
    var body: some View {
        ScrollView {
            LazyVStack {
                // Character Idenitfiying parts
                Section {
                   Text("ID: \(character.id)")
                   Text("Name: \(character.name)")
                   Text("Status: \(character.status)")
                   Text("Species: \(character.species)")
                   Text("Type: \(character.type)")
                   Text("Gender: \(character.gender)")
                   Text("Created: \(character.created)")
                } header: {
                    Text("Identification")
                }
                
                AsyncImage(url: URL(string: character.image)) { image in
                    image
                        .image?.resizable()
                        .scaledToFit()
                }
                Section {
                    // Displaying the Origin details
                    Text("Origin - Name: \(character.origin.name)")
                    Text("Origin - URL: \(character.origin.url)")
                } header: {
                    Text("Origins")
                }

                Section {
                    // Displaying the Location details
                    Text("Location - Name: \(character.location.name)")
                    Text("Location - URL: \(character.location.url)")
                }

                Section {
                    Button("Show episodes appeared in") {
                        showEpisodes.toggle()
                    }
                    
                    if showEpisodes{
                        // Displaying the Episodes (looping through the episodes)
                        ForEach(character.episode, id: \.self) { episodeURL in
                            NavigationLink(destination: EpisodeView(viewModel: viewModel, episodeURL: episodeURL)) {
                                Text("Episode \(episodeURL)")
                            }
                        }
                    }
                } header: {
                    Text("Episodes appeared in")
                }
               
               Text("URL: \(character.url)")
            }
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
