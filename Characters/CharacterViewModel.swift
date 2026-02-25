//  CharacterViewModel.swift
//  Characters
//
//  Created by Andres Godoy on 24/02/26.
//
import Foundation
@MainActor
@Observable
class CharacterViewModel {

    var arrCharacters = [
        Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", image: ""),
        Character(id: 2, name: "Morty Smith", status: "Alive", species: "Human", image: "")
    ]

    func getCharacters() async {
    }
}
