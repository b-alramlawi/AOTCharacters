//
//  CharacterDetailViewModel.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 09/06/2025.
//

import SwiftUI

@MainActor
final class CharacterDetailViewModel: ObservableObject {
    @Published var character: CharacterDetail?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let fetchCharacterDetailUseCase: FetchCharacterDetailUseCase

    init(fetchCharacterDetailUseCase: FetchCharacterDetailUseCase = FetchCharacterDetailUseCase()) {
        self.fetchCharacterDetailUseCase = fetchCharacterDetailUseCase
    }

    func loadCharacterDetail(id: Int) async {
        isLoading = true
        errorMessage = nil
        do {
            character = try await fetchCharacterDetailUseCase.execute(id: id)
        } catch {
            errorMessage = "Failed to load character: \(error.localizedDescription)"
        }
        isLoading = false
    }
}
