//
//  CharacterNameView.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 10/06/2025.
//

import SwiftUI

struct CharacterNameView: View {
    let name: String

    var body: some View {
        Text(name)
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
    }
}
