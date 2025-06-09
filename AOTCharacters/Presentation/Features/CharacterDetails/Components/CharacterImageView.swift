//
//  CharacterImageView.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 10/06/2025.
//

import SwiftUI

struct CharacterImageView: View {
    let imageURL: String?

    var body: some View {
        if let url = URL(string: imageURL ?? "") {
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
    }
}
