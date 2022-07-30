/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Ho Le Minh Thach
 ID: s3877980
 Created  date: 17/07/2022
 Last modified: 17/07/2022
 Acknowledgement:
 Learning from Hacking with Swift to implement Authentication, PhotoPicker, and the usage of CoreData
 Hudson, P. (n.d.). The 100 days of Swiftui. Hacking with Swift. Retrieved July 30, 2022, from https://www.hackingwithswift.com/100/swiftui
*/

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
