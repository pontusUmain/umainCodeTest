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
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(viewModel.filters) { filter in
                        FilterButton(filter: filter, isActive: viewModel.activeFilters.contains(filter), action: {
                            viewModel.didPressFilter(filter)
                        })
                    }
                }
                .padding(.horizontal, 21)
                .padding(.vertical, 8)

            }
            List(viewModel.filteredRestaurants) { restaurant in
                Text(restaurant.name)
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

#Preview {
    RestaurantListView()
}
