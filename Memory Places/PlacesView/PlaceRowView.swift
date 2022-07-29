//
//  PlaceRowView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 16/07/2022.
//

import SwiftUI

struct PlaceRowView: View {
    let title: String
    let isLocked: Bool
    let isFavorited: Bool
    let image: Image
    
    private let favoriteIcon = "star"
    private let favoriteIconAlternative = ".fill"
    private let lockIcon = "lock"
    private let lockIconAlternative = ".open"
    
    var body: some View {
        HStack {
            Image(systemName: generateIcon(favoriteIcon, modifier: favoriteIconAlternative, haveModifier: isFavorited))
                .foregroundColor(isFavorited ? .yellow : .secondary)
            
            image
                .resizable()
                .scaledToFit()
                .padding(.vertical, 5)
                .frame(maxWidth: 80)
                .cornerRadius(5)

            Text(title)
            
            Spacer()
            Image(systemName: generateIcon(lockIcon, modifier: lockIconAlternative, haveModifier: !isLocked))
        }
    }
}

struct PlaceRowView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceRowView(title: "This is cool place", isLocked: false, isFavorited: false, image: Image(systemName: "photo"))
    }
}
