//
//  CharacterDetailDTO.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 09/06/2025.
//

struct CharacterDetailDTO: Codable {
    let id: Int
    let name: String
    let img: String?
    let occupation: String?
    let gender: String?
    let age: Int?
    let height: String?
    let species: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id, name, img, occupation, gender, age, height, species
    }

    func toDomain() -> CharacterDetail {
        CharacterDetail(
            id: id,
            name: name,
            imageURL: img,
            occupation: occupation,
            gender: gender,
            age: age != nil ? "\(age!)" : nil,
            height: height,
            species: species?.joined(separator: ", ")
        )
    }
}

