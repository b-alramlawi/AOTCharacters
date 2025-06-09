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
                        if let url = URL(string: character.imageURL ?? "") {
                            AsyncImage(url: url) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(maxWidth: .infinity, minHeight: 300)
                                        .background(Color.gray.opacity(0.1))
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: .infinity, minHeight: 300)
                                        .clipped()
                                        .cornerRadius(20)
                                        .shadow(radius: 10)
                                        .padding(.horizontal)
                                case .failure:
                                    Image(systemName: Icons.personRectangle)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 300)
                                        .foregroundColor(.gray)
                                        .padding()
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        }

                        // Name
                        Text(character.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)

                        // Character Details Table
                        VStack(spacing: 0) {
                            detailRow(label: Strings.occupation, value: character.occupation)
                            Divider()
                            detailRow(label: Strings.gender, value: character.gender)
                            Divider()
                            detailRow(label: Strings.age, value: character.age)
                            Divider()
                            detailRow(label: Strings.height, value: character.height)
                            Divider()
                            detailRow(label: Strings.species, value: character.species)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color(UIColor.secondarySystemBackground))
                                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                        )
                        .padding(.horizontal)
                        .padding(.top, 10)
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

    @ViewBuilder
    private func detailRow(label: String, value: String?) -> some View {
        HStack {
            Text(label)
                .fontWeight(.medium)
                .foregroundColor(.primary)
            Spacer()
            Text(value ?? Strings.unknown)
                .foregroundColor(.gray)
                .multilineTextAlignment(.trailing)
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
    }
}
