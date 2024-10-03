//
//  NetworkRequest.swift
//  UmainCodeTest
//
//  Created by Pontus Croneld on 2024-10-03.
//

import Foundation

protocol NetworkRequest: AnyObject {
    associatedtype ModelType
    func decode(_ data: Data) throws -> ModelType
    func execute() async throws -> ModelType
}

extension NetworkRequest {
    func load(_ url: URL) async throws -> ModelType {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            // TODO: More specific?
            throw APIError.server
        }
        
        // TODO: Look into these status code, maybe there's more to be deciphered here
        switch response.statusCode {
            case 400 ..< 500: throw APIError.client
            case 500 ..< 600: throw APIError.server
            default: break
        }
        
        return try decode(data)
    }
}
