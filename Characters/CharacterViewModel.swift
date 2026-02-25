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
    var isLoading = false
    var errorMessage: String? = nil

    func getCharacters() async {
        isLoading = true
        errorMessage = nil

        guard let url = URL(string: "https://rickandmortyapi.com/api/character")
        else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }

        let urlRequest = URLRequest(url: url)

        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)

            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                let code = (response as? HTTPURLResponse)?.statusCode ?? -1
                errorMessage = "Request failed (HTTP \(code))"
                isLoading = false
                return
            }

            let results = try JSONDecoder().decode(CharacterResponse.self, from: data)
            arrCharacters = results.results
            isLoading = false

        } catch let error as URLError {
            if error.code == .notConnectedToInternet {
                errorMessage = "No connection. Please try again."
            } else {
                errorMessage = "Network error: \(error.localizedDescription)"
            }
            isLoading = false

        } catch {
            errorMessage = "Unexpected error: \(error.localizedDescription)"
            isLoading = false
        }
    }
}

