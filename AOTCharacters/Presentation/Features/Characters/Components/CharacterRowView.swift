//
//  CharacterRowView.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 09/06/2025.
//

import SwiftUI

struct CharacterRowView: View {
    let character: Character
    var isGrid: Bool = false

    var body: some View {
        NavigationLink(destination: CharacterDetailView(characterId: character.id)) {
            Group {
                if isGrid {
                    VStack(spacing: 8) {
                        AsyncImageView(url: character.imageURL)
                            .frame(width: 100, height: 100)
                            .cornerRadius(12)
                            .clipped()

                        Text(character.name)
                            .font(.headline)
                            .multilineTextAlignment(.center)

                        Text(character.occupation ?? Strings.unknown)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                    )
                } else {
                    HStack(spacing: 16) {
                        AsyncImageView(url: character.imageURL)
                            .frame(width: 80, height: 80)
                            .cornerRadius(12)
                            .clipped()

                        VStack(alignment: .leading, spacing: 4) {
                            Text(character.name)
                                .font(.title3)
                                .fontWeight(.semibold)

                            Text(character.occupation ?? Strings.unknown)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }

                        Spacer()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                    )
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
