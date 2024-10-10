//
//  RestaurantResource.swift
//  UmainCodeTest
//
//  Created by Pontus Croneld on 2024-10-03.
//

import Foundation

struct RestaurantResource: APIResource {
    typealias ModelType = RestaurantResponse
    
    var baseUrl: String {
        return Endpoint.restaurants.baseUrl
    }
    
    var methodPath: String {
        return Endpoint.restaurants.methodPath
    }
    
    var filter: String? {
        return nil
    }
}
