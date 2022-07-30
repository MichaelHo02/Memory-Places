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
