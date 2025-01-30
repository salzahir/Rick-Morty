//
//  CharacterResponse.swift
//  RickAndMorty
//
//  Created by Salman Z on 1/30/25.
//

import Foundation

struct CharacterResponse: Codable {
    let info: info
    let results: [Character]
}

struct info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Origin: Codable {
    let name: String
    let url: String
}

struct Location: Codable {
    let name: String
    let url: String
}
