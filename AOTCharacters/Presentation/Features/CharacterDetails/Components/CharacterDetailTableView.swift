//
//  CharacterDetailTableView.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 10/06/2025.
//

import SwiftUI

struct CharacterDetailTable: View {
    let character: CharacterDetail

    var body: some View {
        VStack(spacing: 0) {
            CharacterDetailRow(label: Strings.occupation, value: character.occupation)
            Divider()
            CharacterDetailRow(label: Strings.gender, value: character.gender)
            Divider()
            CharacterDetailRow(label: Strings.age, value: character.age)
            Divider()
            CharacterDetailRow(label: Strings.height, value: character.height)
            Divider()
            CharacterDetailRow(label: Strings.species, value: character.species)
        }
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(UIColor.secondarySystemBackground))
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
        )
        .padding(.horizontal)
        .padding(.top, 10)
    }
}

