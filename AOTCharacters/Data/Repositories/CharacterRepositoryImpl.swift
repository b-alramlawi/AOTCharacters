//
//  CharacterRepositoryImpl.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 09/06/2025.
//

import Foundation

final class CharacterRepository: CharacterRepositoryProtocol {
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }
    
    func fetchCharacters(page: Int) async throws -> (characters: [Character], hasMore: Bool) {
        let response: CharacterResponseDTO = try await apiClient.fetch(
            "characters",
            parameters: ["page": "\(page)"]
        )
        
        let characters = response.results.map { $0.toDomain() }
        let hasMore = response.info.nextPage != nil
        return (characters, hasMore)
    }
}

