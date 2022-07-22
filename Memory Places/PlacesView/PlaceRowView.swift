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
    
    var body: some View {
        HStack {
            Image(systemName: generateIcon("star", modifier: ".fill", haveModifier: isFavorited))
                .foregroundColor(.yellow)
            
            image
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 80)
                .cornerRadius(5)
            Text(title)
            Spacer()
            Image(systemName: generateIcon("lock", modifier: ".open", haveModifier: !isLocked))
        }
    }
}

struct PlaceRowView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceRowView(title: "This is cool place", isLocked: false, isFavorited: false, image: Image(systemName: "photo"))
    }
}
