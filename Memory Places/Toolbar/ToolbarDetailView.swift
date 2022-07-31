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

struct ToolbarDetailView: ToolbarContent {
    @Binding var isLocked: Bool
    @Binding var showingDeleteAlert: Bool
    @Binding var isFavorited: Bool
    
    private let lockLabel = "Lock"
    private let lockIcon = "lock"
    private let lockIconAlternative = ".open"
    
    private let deleteLabel = "Delete"
    private let deleteIcon = "trash"
    
    private let favoriteLabel = "Favorite"
    private let favoriteIcon = "star"
    private let favoriteIconAlternative = ".fill"
    
    var body: some ToolbarContent {
        // button to locked
        ToolbarItem(placement: .primaryAction) {
            Button { isLocked.toggle() } label: {
                Label(lockLabel, systemImage: generateIcon(
                    lockIcon, modifier: lockIconAlternative, haveModifier: !isLocked
                ))
            }
        }
        
        ToolbarItemGroup(placement: .bottomBar) {
            // delete button
            Button(role: .destructive) { showingDeleteAlert = true } label: {
                Label(deleteLabel, systemImage: deleteIcon)
            }
            // favorite button
            Button { isFavorited.toggle() } label: {
                Label(favoriteLabel, systemImage: generateIcon(
                    favoriteIcon, modifier: favoriteIconAlternative, haveModifier: isFavorited
                ))
            }
        }
    }
}
