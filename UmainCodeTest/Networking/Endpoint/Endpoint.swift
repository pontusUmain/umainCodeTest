//
//  Endpoint.swift
//  UmainCodeTest
//
//  Created by Pontus Croneld on 2024-10-03.
//

import Foundation

enum Endpoint {
    case restaurants
    case filter(id: String)
    case openStatus(id: String)
}

extension Endpoint {
    var baseUrl: String {
        return "https://food-delivery.umain.io/api/v1/"
    }
    
    var methodPath: String {
        switch self {
        case .filter(let id):
            return "filter/\(id)"
        case .restaurants:
            return "restaurants"
        case .openStatus(let id):
            return "open/\(id)"
        }
    }
}
