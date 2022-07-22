//
//  AdditionalSectionView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 17/07/2022.
//

import SwiftUI

struct AdditionalSectionView: View {
    @Binding var excitedLevel: Int
    @Binding var isLocked: Bool
    @Binding var isFavorited: Bool
    
    var body: some View {
        Section {
            Picker(selection: $excitedLevel) {
                ForEach(1...5, id: \.self) {
                    Text("\($0)")
                }
            } label: {
                Label("Excited Level", systemImage: "hand.thumbsup")
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
