//
//  Character.swift
//  Characters
//
//  Created by Andres Godoy on 24/02/26.
//

import Foundation

struct CharacterResponse: Decodable {
    var results: [Character]
}

struct Character: Decodable, Identifiable, Hashable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var image: String
}
