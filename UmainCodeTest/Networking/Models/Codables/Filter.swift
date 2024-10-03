//
//  Filter.swift
//  UmainCodeTest
//
//  Created by Pontus Croneld on 2024-10-03.
//

import Foundation

struct Filter: Identifiable, Hashable {
    let id: String
    let name: String
    let imageUrl: String
}

extension Filter: Codable {
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case id, name
    }
}
