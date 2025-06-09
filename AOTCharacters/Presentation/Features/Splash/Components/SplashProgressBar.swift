//
//  SplashProgressBar.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 10/06/2025.
//

import SwiftUI

struct SplashProgressBar: View {
    var progress: CGFloat

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 2.5)
                .frame(width: 200, height: 5)
                .foregroundColor(Color.gray.opacity(0.3))

            LinearGradient(colors: [Color.red, Color.orange],
                           startPoint: .leading,
                           endPoint: .trailing)
                .frame(width: 200 * progress, height: 5)
                .cornerRadius(2.5)
                .animation(.easeInOut(duration: 0.2), value: progress)
        }
        .padding(.top, 20)
    }
}
