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
                                HStack(spacing: 12) {
                                    AsyncImage(url: URL(string: ch.image)) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView().frame(width: 44, height: 44)
                                        case .success(let img):
                                            img.resizable()
                                                .scaledToFill()
                                                .frame(width: 44, height: 44)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                        case .failure:
                                            Image(systemName: "person")
                                                .frame(width: 44, height: 44)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }

                                    VStack(alignment: .leading) {
                                        Text(ch.name).font(.headline)
                                        Text("\(ch.species) • \(ch.status)")
                                            .font(.subheadline)
                                            .foregroundStyle(.secondary)
                                    }
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
