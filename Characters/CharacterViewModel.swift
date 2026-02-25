//  CharacterViewModel.swift
//  Characters
//
//  Created by Andres Godoy on 24/02/26.
//
import Foundation
@MainActor
@Observable
class CharacterViewModel {

    var arrCharacters = [Character]()

    func getCharacters() async {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character")
        else { return }

        let urlRequest = URLRequest(url: url)

        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)

            guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }

            let results = try JSONDecoder().decode(CharacterResponse.self, from: data)
            arrCharacters = results.results

        } catch {
        }
    }
}
