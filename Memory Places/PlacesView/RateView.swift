/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Ho Le Minh Thach
 ID: s3877980
 Created  date: 25/07/2022
 Last modified: 25/07/2022
 Acknowledgement:
 Learning from Hacking with Swift to implement Authentication, PhotoPicker, and the usage of CoreData
 Hudson, P. (n.d.). The 100 days of Swiftui. Hacking with Swift. Retrieved July 30, 2022, from https://www.hackingwithswift.com/100/swiftui
*/

import SwiftUI

/// This view will display a row of icon for rating
struct RateView: View {
    
    /// Keep track of the current rating from parent view
    @Binding var rating: Int
    
    /// The maximum icon item allowed to render
    let maximumRating: Int
    
    /// The icon when user not selected
    let offImage: Image
    
    /// The icon that user selected
    let onImage: Image
    
    /// The color render on icon when user not selected
    let offColor = Color.gray
    
    /// The color render on icon when user selected
    let onColor = Color.red
    
    var body: some View {
        // Create a row with icon
        HStack {
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    // base on the current rating to decide the color for icon
                    .foregroundColor(number > rating ? offColor : onColor)
                    // update the current rating base on the number corresponding to the icon
                    .onTapGesture { rating = number }
            }
        }
    }
    
    /// This function will generate an icon image base on the status of the rating
    /// - Parameter number: The current position of the icon
    /// - Returns: Image that either non-selected or selected
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage
        } else {
            return onImage
        }
    }
}
