//
//  CharacterDetailRepositoryProtocol.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 09/06/2025.
//

protocol CharacterDetailRepositoryProtocol {
    func fetchCharacterDetail(id: Int) async throws -> CharacterDetail
}
