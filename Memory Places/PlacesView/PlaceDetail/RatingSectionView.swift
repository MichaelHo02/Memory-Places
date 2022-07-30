//
//  RatingSectionView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 30/07/2022.
//

import SwiftUI

struct RatingSectionView: View {
    let rate: Int
    
    private let titleRating = "Rating"
    private let icon = "heart"
    private let iconAlternative = "heart.fill"
    
    var body: some View {
        HStack {
            Text(titleRating)
                .font(.title2)
            Spacer()
            RateView(
                rating: .constant(rate), maximumRating: 5,
                offImage: Image(systemName: icon),
                onImage: Image(systemName: iconAlternative)
            )
        }
    }
}
