//
//  RateView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 25/07/2022.
//

import SwiftUI

struct RateView: View {
    @Binding var rating: Int
    
    let maximumRating: Int
    
    let offImage: Image
    let onImage: Image
    
    let offColor = Color.gray
    let onColor = Color.red
    
    var body: some View {
        HStack {
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture { rating = number }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage
        } else {
            return onImage
        }
    }
}
