//
//  SplashView.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 10/06/2025.
//

import SwiftUI

struct SplashView: View {
    @StateObject private var viewModel = SplashViewModel()

    var body: some View {
        if viewModel.isActive {
            MainView()
        } else {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack(spacing: 20) {
                    Image("SplashImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)

                    SplashProgressBar(progress: viewModel.progress)
                }
            }
            .onAppear {
                viewModel.startLoading()
            }
        }
    }
}


