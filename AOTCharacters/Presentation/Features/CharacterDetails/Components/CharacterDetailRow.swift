//
//  CharacterDetailRow.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 10/06/2025.
//

import SwiftUI

struct CharacterDetailRow: View {
    let label: String
    let value: String?

    var body: some View {
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
