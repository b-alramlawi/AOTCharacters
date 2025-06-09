//
//  CharacterDTO.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 09/06/2025.
//

import Foundation

struct CharacterResponseDTO: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let nextPage: String?
        let prevPage: String?
        
        enum CodingKeys: String, CodingKey {
            case count
            case pages
            case nextPage = "next_page"
            case prevPage = "prev_page"
        }
    }
    
    let info: Info
    let results: [CharacterDTO]
}

struct CharacterDTO: Codable {
    let id: Int
    let name: String
    let img: String?
    let occupation: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case img
        case occupation
    }
    
    func toDomain() -> Character {
        return Character(
            id: id,
            name: name,
            imageURL: img,
            occupation: occupation
        )
    }
}
