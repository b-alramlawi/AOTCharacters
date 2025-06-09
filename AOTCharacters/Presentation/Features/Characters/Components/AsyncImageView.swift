//
//  AsyncImageView.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 09/06/2025.
//

import SwiftUI

struct AsyncImageView: View {
    let url: String?
    
    var body: some View {
        Group {
            if let urlString = url, let url = URL(string: urlString) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 80, height: 80)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(12)

                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipped()
                            .cornerRadius(12)

                    case .failure:
                        Image(systemName: Icons.personSquareFill)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.gray)
                            .cornerRadius(12)

                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: Icons.personSquareFill)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.gray)
                    .cornerRadius(12)
            }
        }
    }
}
