/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Ho Le Minh Thach
 ID: s3877980
 Created  date: 16/07/2022
 Last modified: 16/07/2022
 Acknowledgement:
 Learning from Hacking with Swift to implement Authentication, PhotoPicker, and the usage of CoreData
 Hudson, P. (n.d.). The 100 days of Swiftui. Hacking with Swift. Retrieved July 30, 2022, from https://www.hackingwithswift.com/100/swiftui
*/

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
