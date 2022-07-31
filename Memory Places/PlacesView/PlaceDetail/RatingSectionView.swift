/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Ho Le Minh Thach
 ID: s3877980
 Created  date: 30/07/2022
 Last modified: 30/07/2022
 Acknowledgement:
 Learning from Hacking with Swift to implement Authentication, PhotoPicker, and the usage of CoreData
 Hudson, P. (n.d.). The 100 days of Swiftui. Hacking with Swift. Retrieved July 30, 2022, from https://www.hackingwithswift.com/100/swiftui
*/

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
