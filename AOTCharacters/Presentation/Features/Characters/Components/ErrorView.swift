//
//  ErrorView.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 09/06/2025.
//

import SwiftUI

struct ErrorView: View {
    let error: String
    let retryAction: () -> Void
    
    var body: some View {
        VStack {
            Text(error)
                .foregroundColor(.red)
                .padding()
                .background(Color.yellow.opacity(0.2))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.brown, lineWidth: 2)
                )
            Button(Strings.retry, action: retryAction)
                .padding()
        }
    }
}
