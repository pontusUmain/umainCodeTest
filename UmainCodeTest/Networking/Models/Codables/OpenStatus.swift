//
//  OpenStatus.swift
//  UmainCodeTest
//
//  Created by Pontus Croneld on 2024-10-03.
//

import Foundation

struct OpenStatus: Hashable {
    let restaurantId: String
    let isCurrentlyOpen: Bool
}

extension OpenStatus: Codable {
    enum CodingKeys: String, CodingKey {
        case restaurantId = "restaurant_id"
        case isCurrentlyOpen = "is_currently_open"
    }
}
