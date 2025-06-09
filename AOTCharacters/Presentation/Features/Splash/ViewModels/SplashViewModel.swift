//
//  SplashViewModel.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 10/06/2025.
//

import SwiftUI
import Combine

class SplashViewModel: ObservableObject {
    @Published var isActive = false
    @Published var progress: CGFloat = 0.0

    private var timer: Timer?
    
    func startLoading() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            if self.progress < 1.0 {
                self.progress += 0.02
            } else {
                timer.invalidate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }

    deinit {
        timer?.invalidate()
    }
}
