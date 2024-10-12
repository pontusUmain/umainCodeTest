//
//  RestaurantListViewModel.swift
//  UmainCodeTest
//
//  Created by Pontus Croneld on 2024-10-12.
//

import Foundation
import SwiftUI

@Observable class RestaurantListViewModel {
    private var restaurants = [Restaurant]()
    private(set) var filteredRestaurants = [Restaurant]()
    private(set) var filters = [Filter]()
    private(set) var activeFilters = [Filter]()
    private(set) var isLoading = false
    
    @MainActor
    func loadView() async throws {
        guard !isLoading else { return }
        defer { isLoading = false }
        isLoading = true
        try await fetchRestaurants()
        try await fetchFilters(filterIds: getFiltersIds())
    }

    private func fetchRestaurants() async throws {
        let resource = RestaurantResource()
        let request = APIRequest(resource: resource)
        let result = try await request.execute()
        restaurants = result.restaurants
        filteredRestaurants = result.restaurants
    }
    
    private func getFiltersIds() -> [String] {
        var filterIds = [String]()
        for restaurant in restaurants {
            let newFilters = restaurant.filterIds.filter { !filterIds.contains($0) }
            filterIds += newFilters
        }
        return filterIds
    }
    
    private func fetchFilters(filterIds: [String]) async throws {
        for filter in filterIds {
            let resource = FilterResource(id: filter)
            let request = APIRequest(resource: resource)
            let result = try await request.execute()
            filters.append(result)
        }
    }
    
    @MainActor 
    func didPressFilter(_ filter: Filter) {
        if activeFilters.contains(filter) {
            activeFilters.removeAll { 
                $0.id == filter.id
            }
        } else {
            activeFilters.append(filter)
        }
        
        updateFilteredRestaurantsList()
    }
    
    @MainActor
    private func updateFilteredRestaurantsList() {
        if activeFilters.isEmpty {
            filteredRestaurants = restaurants
        } else {
            var filtered = [Restaurant]()
            let activeFilterIds = activeFilters.map { $0.id }
            for restaurant in restaurants {
                if restaurant.filterIds.contains(activeFilterIds) {
                    filtered.append(restaurant)
                }
            }
            filteredRestaurants = filtered
        }
    }
}
