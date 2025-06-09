//
//  CharacterViewModel.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 09/06/2025.
//

import SwiftUI
import Combine

@MainActor
final class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var searchText = ""
    @Published var hasMoreCharacters = true
    
    private var currentPage = 1
    private let fetchCharactersUseCase: FetchCharactersUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(fetchCharactersUseCase: FetchCharactersUseCase = FetchCharactersUseCase(
        repository: CharacterRepository()
    )) {
        self.fetchCharactersUseCase = fetchCharactersUseCase
    }
    
    var filteredCharacters: [Character] {
        if searchText.isEmpty {
            return characters
        }
        return characters.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
    
    func loadCharacters() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let (newCharacters, hasMore) = try await fetchCharactersUseCase.execute(page: currentPage)
            characters = newCharacters
            hasMoreCharacters = hasMore
            currentPage += 1
        } catch {
            errorMessage = "Failed to load characters: \(error.localizedDescription)"
            print("Load Characters Error: \(error)")
        }
        
        isLoading = false
    }
    
    func loadMoreCharacters() async {
        guard hasMoreCharacters, !isLoading else { return }
        
        isLoading = true
        do {
            let (newCharacters, hasMore) = try await fetchCharactersUseCase.execute(page: currentPage)
            characters.append(contentsOf: newCharacters)
            hasMoreCharacters = hasMore
            currentPage += 1
        } catch {
            errorMessage = "Failed to load more characters: \(error.localizedDescription)"
            print("Load More Characters Error: \(error)")
        }
        isLoading = false
    }
    
    func refresh() async {
        currentPage = 1
        characters = []
        hasMoreCharacters = true
        await loadCharacters()
    }
}

