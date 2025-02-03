//
//  EpisodeView.swift
//  RickAndMorty
//
//  Created by Salman Z on 1/30/25.
//

import Foundation
import SwiftUI

struct EpisodeView: View {
    @ObservedObject var viewModel: ViewModel
    let episodeURL: String
    @State private var episode: Episode? = nil
    
    var body: some View {
        
        ScrollView {
            if let episode = episode {
               Text(episode.name)
                   .font(.title2)
                   .padding(.top)
               
               Text("Air Date: \(episode.air_date)")
                   .padding(.top, 5)
               
               Text("Episode: \(episode.episode)")
                   .padding(.top, 5)
               
               
                Text("Characters: \(episode.characters.joined(separator: ", "))")
                   .padding(.top, 5)
                
//                ForEach(episode.characters) { characterURL in
//                    let charachter = ViewModel.fetchCharacters(characterURL: characterURL)
//                    DetailView(viewModel: viewModel, character: charachter)
//                }
                
               Text("URL: \(episode.url)")
                   .padding(.top, 5)
               
               Text("Created: \(episode.created)")
                   .padding(.top, 5)
           } else {
               Text("Loading episode details...")
                   .italic()
                   .padding(.top)
           }
        }
        .task {
            await self.episode = viewModel.loadEpisode(episodeURL: episodeURL)
        }
    }
    
}
