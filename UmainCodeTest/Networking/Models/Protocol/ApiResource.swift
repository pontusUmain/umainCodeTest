//
//  ApiResource.swift
//  UmainCodeTest
//
//  Created by Pontus Croneld on 2024-10-03.
//

import Foundation

protocol APIResource {
    associatedtype ModelType: Codable
    var methodPath: String { get }
    var filter: String? { get }
    var baseUrl: String { get }
}

extension APIResource {
    var url: URL {
        let url = URL(string: baseUrl)!
            .appendingPathComponent(methodPath)
        // Currently no filtering endpoints
        guard let filter else { return url }
        return url.appending(queryItems: [URLQueryItem(name: "filter", value: filter)])
    }
}
