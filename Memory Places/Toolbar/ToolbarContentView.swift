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

struct ToolbarContentView: ToolbarContent {
    
    private let addMockDataMsg = "Add Mock Data"
    private let addMockDataLogo = "externaldrive.badge.plus"
    private let clearAllMsg = "Clear All"
    private let clearAllLogo = "trash"
    private let pickerMsg = "Display Selection"
    private let newPlaceMsg = "New Place"
    private let newPlaceIcon = "square.and.pencil"
    private let moreMsg = "More"
    private let moreIcon = "ellipsis.circle"
    
    let addMockData: () -> Void
    
    @Binding var showingCreationSheet: Bool
    @Binding var showingDeleteAllAlert: Bool
    var count: Int
    
    var body: some ToolbarContent {
        // create edit button to delete element
        ToolbarItem(placement: .primaryAction) {
            EditButton()
        }

        ToolbarItemGroup(placement: .bottomBar) {
            // create a menu with buttons
            Menu {
                Button(action: addMockData) {
                    Label(addMockDataMsg, systemImage: addMockDataLogo)
                }
                Button(role: .destructive) { showingDeleteAllAlert.toggle() } label: {
                    Label(clearAllMsg, systemImage: clearAllLogo)
                }
            } label: {
                Label(moreMsg, systemImage: moreIcon)
            }
            Spacer()
            Text("Places: \(count)")
            Spacer()
            Button { showingCreationSheet.toggle() } label: {
                Label(newPlaceMsg, systemImage: newPlaceIcon)
            }
        }
    }
}
