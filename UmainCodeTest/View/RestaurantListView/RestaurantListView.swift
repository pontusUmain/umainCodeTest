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
        VStack {
            List(viewModel.restaurants) { restaurant in
                Text(restaurant.name)
            }
            List(viewModel.filters) { filter in
                Text(filter.name)
            }
        }
        .task {
            try? await viewModel.loadView()
        }
        .refreshable {
            try? await viewModel.loadView()
        }
    }
}

@Observable class RestaurantListViewModel {
    private(set) var restaurants = [Restaurant]()
    private(set) var filters = [Filter]()
    private(set) var isLoading = false
    
    @MainActor
    func loadView() async throws {
        guard !isLoading else { return }
        defer { isLoading = false }
        isLoading = true
        try await fetchRestaurants()
        try await fetchFilters(filterIds: getFiltersIds())
    }

    func fetchRestaurants() async throws {
        let resource = RestaurantResource()
        let request = APIRequest(resource: resource)
        let result = try await request.execute()
        restaurants = result.restaurants
    }
    
    func getFiltersIds() -> [String] {
        var filterIds = [String]()
        for restaurant in restaurants {
            let newFilters = restaurant.filterIds.filter { !filterIds.contains($0) }
            filterIds += newFilters
        }
        return filterIds
    }
    
    func fetchFilters(filterIds: [String]) async throws {
        for filter in filterIds {
            let resource = FilterResource(id: filter)
            let request = APIRequest(resource: resource)
            let result = try await request.execute()
            filters.append(result)
        }
    }
}

#Preview {
    RestaurantListView()
}
