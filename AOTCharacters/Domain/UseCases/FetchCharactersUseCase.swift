//
//  FetchCharactersUseCase.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 09/06/2025.
//

import Foundation

final class FetchCharactersUseCase {
    private let repository: CharacterRepositoryProtocol
    
    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(page: Int) async throws -> (characters: [Character], hasMore: Bool) {
        try await repository.fetchCharacters(page: page)
    }
}
