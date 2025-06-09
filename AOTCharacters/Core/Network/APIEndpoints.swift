//
//  APIEndpoints.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 10/06/2025.
//

import Foundation

enum APIEndpoints {
    static let characters = "characters"
    
    static func characterDetail(id: String) -> String {
        return "characters/\(id)"
    }
}


