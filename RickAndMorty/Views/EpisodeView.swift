//
//  EpisodeView.swift
//  RickAndMorty
//
//  Created by Salman Z on 1/30/25.
//

import Foundation
import SwiftUI

struct EpisodeView: View {
    @State var episode: Episode?
    let episodeURL: String
    
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
                
                Text("URL: \(episode.url)")
                    .padding(.top, 5)
                
                Text("Created: \(episode.created)")
                    .padding(.top, 5)
            } else {
                Text("No episode data available")
                    .italic()
                    .padding(.top)
            }
        }
        .task {
            do {
                if let episode = try? await fetchEpisode(episode: episodeURL) {
                    self.episode = episode
                }
            }
        }
    }
    
    func fetchEpisode(episode: String) async throws -> Episode {
        
        guard let url = URL(string: episodeURL) else {
            print("Error")
            throw URLError(.badURL)
        }
    
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(Episode.self, from: data)
        return response
    }
}
