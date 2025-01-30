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
        VStack {
            Text(episode?.name ?? "None")
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
