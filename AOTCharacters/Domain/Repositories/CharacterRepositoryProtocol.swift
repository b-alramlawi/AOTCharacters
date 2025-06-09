//
//  CharacterRepositoryProtocol.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 09/06/2025.
//

protocol CharacterRepositoryProtocol {
    func fetchCharacters(page: Int) async throws -> (characters: [Character], hasMore: Bool)
}
