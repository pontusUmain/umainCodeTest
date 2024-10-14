//
//  DetailView.swift
//  UmainCodeTest
//
//  Created by Pontus Croneld on 2024-10-14.
//

import SwiftUI

struct DetailView: View {
    
    @State var viewModel: DetailViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.restaurant.name)
            if let status = viewModel.openStatus {
                Text("Is open: \(status.isCurrentlyOpen)")
            }
        }
        .task {
            try? await viewModel.fetchOpenStatus()
        }
    }
}

#Preview {
    DetailView(viewModel: .init(restaurant: .mock))
}
