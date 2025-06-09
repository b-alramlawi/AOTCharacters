//
//  CharacterDetailView.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 09/06/2025.
//

import SwiftUI

struct CharacterDetailView: View {
    let characterId: Int
    @StateObject private var viewModel = CharacterDetailViewModel()

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let character = viewModel.character {
                ScrollView {
                    VStack(spacing: 16) {
                        CharacterImageView(imageURL: character.imageURL)
                        CharacterNameView(name: character.name)
                        CharacterDetailTable(character: character)
                    }
                    .padding(.vertical)
                }
            } else if let error = viewModel.errorMessage {
                ErrorView(error: error) {
                    Task {
                        await viewModel.loadCharacterDetail(id: characterId)
                    }
                }
            }
        }
        .navigationTitle(Strings.characterDetailTitle)
        .task {
            await viewModel.loadCharacterDetail(id: characterId)
        }
    }
}
