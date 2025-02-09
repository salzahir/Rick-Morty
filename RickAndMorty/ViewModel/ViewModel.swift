//
//  ViewModel.swift
//  RickAndMorty
//
//  Created by Salman Z on 2/2/25.
//
import SwiftUI

class ViewModel: ObservableObject {
    @Published var characters: [Character]  = []
    @Published var episodes: [Episode]  = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var searchText = ""

    
    var filteredcharacters: [Character] {
        if searchText.isEmpty {
            return characters
        } else {
            return characters.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    enum Errors: Swift.Error {
        case invalidURL(errorMessage: String)
        case decodingFailed
    }
    
    // MARK: - Fetch Characters function API Call
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
    
    // MARK: - Load Episode
    /// Loads an episode from the provided URL.
    /// - Parameter episodeURL: The URL of the episode.
    /// - Returns: The fetched `Episode` or `nil` if an error occurs.
    func loadEpisode(episodeURL: String) async -> Episode? {
        isLoading = true
        errorMessage = nil
        do {
            return try await fetchEpisode(episodeURL: episodeURL)
        } catch {
            print("Error: \(error)")
            errorMessage = "Failed to load episode. Please try again later."
            isLoading = false
            return nil
        }
    }

    // MARK: - Fetch Episode
    /// Fetches an episode from the given URL.
    /// - Parameter episodeURL: The URL of the episode.
    /// - Returns: The fetched `Episode` object.
    /// - Throws: An error if the URL is invalid or the fetch fails.
    func fetchEpisode(episodeURL: String) async throws -> Episode {
        guard let url = URL(string: episodeURL) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(Episode.self, from: data)
        return response
    }

}
