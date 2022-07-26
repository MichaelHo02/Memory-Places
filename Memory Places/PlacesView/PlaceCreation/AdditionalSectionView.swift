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
    
    var body: some View {
        Section {
//            Picker(selection: $excitedLevel) {
//                ForEach(1...5, id: \.self) {
//                    Text("\($0)")
//                }
//            } label: {
//                Label("Excited Level", systemImage: "hand.thumbsup")
//            }
            HStack {
                Label("Rate", systemImage: "heart")
                Spacer()
                RateView(
                    rating: $rate, maximumRating: 5,
                    offImage: Image(systemName: "heart"),
                    onImage: Image(systemName: "heart.fill")
                )
            }
            
            Toggle(isOn: $isLocked) {
                Label("Lock", systemImage: generateIcon(
                    "lock", modifier: ".open", haveModifier: !isLocked
                ))
            }
            Toggle(isOn: $isFavorited) {
                Label("Favorite", systemImage: generateIcon(
                    "star", modifier: ".fill", haveModifier: isFavorited
                ))
            }
            
        }
    }
}
