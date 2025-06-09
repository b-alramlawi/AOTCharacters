//
//  SplashView.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 10/06/2025.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var progress: CGFloat = 0.0

    var body: some View {
        if isActive {
            MainView()
        } else {
            ZStack {
                Color.black
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Image("SplashImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)

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
            .onAppear {
                simulateLoading()
            }
        }
    }

    private func simulateLoading() {
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            if progress < 1.0 {
                progress += 0.02
            } else {
                timer.invalidate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

