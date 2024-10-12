//
//  FilterButton.swift
//  UmainCodeTest
//
//  Created by Pontus Croneld on 2024-10-12.
//

import SwiftUI

struct FilterButton: View {
    
    let filter: Filter
    let isActive: Bool
    let action: () -> ()
    
    var body: some View {
        Button(action: { action() }) {
            HStack(spacing: 8) {
                if let url = URL(string: filter.imageUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                    } placeholder: {
                        Color.gray
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                    }
                }
                Text(filter.name)
                    .padding(.trailing, 16)
                    .foregroundColor(isActive ? .white : .primary)
            }
            .background(
                Capsule()
                    .fill(isActive ? .filterActive : Color.white)
                    .shadow(color: .gray.opacity(0.4), radius: 2, x: 0, y: 2)
                )
                }
    }
}

#Preview {
    HStack {
        FilterButton(filter: .mock, isActive: true, action: {})
        FilterButton(filter: .mock, isActive: false, action: {})
    }
}
