//
//  Episode.swift
//  RickAndMorty
//
//  Created by Salman Z on 1/30/25.
//

import Foundation

struct Episode: Codable, Hashable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}

