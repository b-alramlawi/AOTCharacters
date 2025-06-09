//
//  CharacterDetailRepository.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 09/06/2025.
//

final class CharacterDetailRepository: CharacterDetailRepositoryProtocol {
    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }

    func fetchCharacterDetail(id: Int) async throws -> CharacterDetail {
        let dto: CharacterDetailDTO = try await apiClient.fetch("characters/\(id)", parameters: nil)
        return dto.toDomain()
    }
}
