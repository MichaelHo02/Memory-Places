//
//  AdditionalSectionView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 17/07/2022.
//

import SwiftUI

struct AdditionalSectionView: View {
    @Binding var rate: Int
    @Binding var isLocked: Bool
    @Binding var isFavorited: Bool
    
    private let headerAdditonal = "Additional Info"
    
    private let labelRate = "Rate"
    private let labelRateIcon = "heart"
    private let labelRateIconSelected = "heart.fill"
    
    private let labelLock = "Lock"
    private let labelLockIcon = "lock"
    private let labelLockIconAlternative = ".open"
    
    private let labelFavorite = "Favorite"
    private let labelFavoriteIcon = "star"
    private let labelFavoriteIconAlternative = ".fill"
    
    var body: some View {
        Section {
            HStack {
                Label(labelRate, systemImage: labelRateIcon)
                Spacer()
                RateView(
                    rating: $rate, maximumRating: 5,
                    offImage: Image(systemName: labelRateIcon),
                    onImage: Image(systemName: labelRateIconSelected)
                )
            }
            
            Toggle(isOn: $isLocked) {
                Label(labelLock, systemImage: generateIcon(
                    labelLockIcon, modifier: labelLockIconAlternative, haveModifier: !isLocked
                ))
            }
            
            Toggle(isOn: $isFavorited) {
                Label(labelFavorite, systemImage: generateIcon(
                    labelFavoriteIcon, modifier: labelFavoriteIconAlternative, haveModifier: isFavorited
                ))
            }
        } header: {
            Text(headerAdditonal)
        }
    }
}
