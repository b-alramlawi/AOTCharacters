//
//  FetchCharacterDetailUseCase.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 09/06/2025.
//

final class FetchCharacterDetailUseCase {
    private let repository: CharacterDetailRepositoryProtocol

    init(repository: CharacterDetailRepositoryProtocol = CharacterDetailRepository()) {
        self.repository = repository
    }

    func execute(id: Int) async throws -> CharacterDetail {
        try await repository.fetchCharacterDetail(id: id)
    }
}
