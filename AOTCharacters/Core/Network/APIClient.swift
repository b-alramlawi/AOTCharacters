//
//  APIClient.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 09/06/2025.
//

import Foundation

protocol APIClientProtocol {
    func fetch<T: Decodable>(_ endpoint: String, parameters: [String: String]?) async throws -> T
}

final class APIClient: APIClientProtocol {
    static let shared = APIClient()
    private let baseUrl = NetworkConstants.baseURL
    
    func fetch<T: Decodable>(_ endpoint: String, parameters: [String: String]? = nil) async throws -> T {
        var components = URLComponents(string: "\(baseUrl)/\(endpoint)")
        
        if let parameters = parameters {
            components?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        guard let url = components?.url else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let httpResponse = response as? HTTPURLResponse {
            print("HTTP Status Code: \(httpResponse.statusCode)")
        }
        
        if let jsonString = String(data: data, encoding: .utf8) {
            print("Raw JSON Response: \(jsonString)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            print("Decoding Error: \(error)")
            throw error
        }
    }
}

