//
//  Restaurant.swift
//  UmainCodeTest
//
//  Created by Pontus Croneld on 2024-10-03.
//

import Foundation

struct Restaurant: Identifiable, Hashable {
    let filterIds: [String]
    let deliveryTimeMinutes: Double
    let rating: Double
    let imageUrl: String
    let id: String
    let name: String
}

extension Restaurant: Codable {
    enum CodingKeys: String, CodingKey {
        case deliveryTimeMinutes = "delivery_time_minutes"
        case imageUrl = "image_url"
        case filterIds, rating, id, name
    }
}

extension Restaurant {
    static let mock = Restaurant(filterIds: [], deliveryTimeMinutes: 10, rating: 5, imageUrl: "https://picsum.photos/300", id: "id", name: "Mock")
}
