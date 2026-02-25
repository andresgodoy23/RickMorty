//
//  CharacterDetailView.swift
//  Characters
//
//  Created by Andres Godoy on 24/02/26.
//
import SwiftUI

struct CharacterDetailView: View {
    var character: Character

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {

                AsyncImage(url: URL(string: character.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView().frame(height: 260)
                    case .success(let img):
                        img.resizable()
                            .scaledToFill()
                            .frame(height: 260)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    case .failure:
                        Text("Imagen no disponible")
                            .foregroundStyle(.secondary)
                            .frame(height: 260)
                    @unknown default:
                        EmptyView()
                    }
                }

                Text(character.name)
                    .font(.title)
                    .bold()

                Text("Species: \(character.species)")
                Text("Status: \(character.status)")

            }
            .padding()
        }
        .navigationTitle("Detalle")
        .navigationBarTitleDisplayMode(.inline)
    }
}
