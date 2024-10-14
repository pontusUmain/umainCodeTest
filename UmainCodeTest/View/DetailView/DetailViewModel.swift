//
//  DetailViewModal.swift
//  UmainCodeTest
//
//  Created by Pontus Croneld on 2024-10-14.
//

import Foundation
import SwiftUI

@Observable class DetailViewModel {
    let restaurant: Restaurant
    var openStatus: OpenStatus?
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
    
    @MainActor
    func fetchOpenStatus() async throws {
        let resource = OpenStatusResource(id: restaurant.id)
        let request = APIRequest(resource: resource)
        let result = try await request.execute()
        openStatus = result
    }
}
