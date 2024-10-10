//
//  RestaurantListView.swift
//  UmainCodeTest
//
//  Created by Pontus Croneld on 2024-10-03.
//

import SwiftUI

struct RestaurantListView: View {
    
    @State private var viewModel = RestaurantListViewModel()
    
    var body: some View {
        List(viewModel.restaurants) { restaurant in
            Text(restaurant.name)
        }
        .task {
            try? await viewModel.fetchRestaurants()
        }
        .refreshable {
            try? await viewModel.fetchRestaurants()
        }
    }
}

@Observable class RestaurantListViewModel {
    private(set) var restaurants: [Restaurant] = []
    private(set) var isLoading = false

    @MainActor
    func fetchRestaurants() async throws {
        guard !isLoading else { return }
        defer { isLoading = false }
        isLoading = true
        let resource = RestaurantResource()
        let request = APIRequest(resource: resource)
        let result: RestaurantResponse = try await request.execute()
        restaurants = result.restaurants
    }
}

#Preview {
    RestaurantListView()
}
