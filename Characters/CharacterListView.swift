//
//  CharacterListView.swift
//  Characters
//
//  Created by Andres Godoy on 24/02/26.
//

import SwiftUI

struct CharacterListView: View {

    @State var characterVM: CharacterViewModel? = nil

    var body: some View {
        NavigationStack {
            VStack {

                Text("Rick & Morty")
                    .font(.title2)
                    .bold()
                    .padding(.top, 8)

                if let characterVM {
                    List {
                        ForEach(characterVM.arrCharacters) { ch in
                            NavigationLink {
                                CharacterDetailView(character: ch)
                            } label: {
                                VStack(alignment: .leading) {
                                    Text(ch.name)
                                        .font(.headline)
                                    Text("\(ch.species) • \(ch.status)")
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
                                .padding(.vertical, 6)
                            }
                        }
                    }
                    .listStyle(.plain)
                } else {
                    ProgressView()
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
        .task {
            if characterVM == nil {
                await MainActor.run {
                    characterVM = CharacterViewModel()
                }
            }
            await characterVM?.getCharacters()
        }
    }
}
