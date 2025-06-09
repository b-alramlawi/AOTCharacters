//
//  SearchBar.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 09/06/2025.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField(Strings.searchPlaceholder, text: $text)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: Icons.clearButton)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}
