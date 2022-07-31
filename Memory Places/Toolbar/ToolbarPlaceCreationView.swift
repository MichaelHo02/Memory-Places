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

struct ToolbarPlaceCreationView: ToolbarContent {
    @Environment(\.dismiss) var dismiss

    let saveItem: () -> Void
    let allowSubmit: () -> Bool
    
    private let addLabel = "Add"
    private let cancelLabel = "Cancel"
    
    var body: some ToolbarContent {
        // confirm button - create item
        ToolbarItem(placement: .confirmationAction) {
            Button(addLabel, action: saveItem)
                .disabled(allowSubmit())
        }
        
        // cancle button
        ToolbarItem(placement: .cancellationAction) {
            Button(cancelLabel, role: .cancel) {
                dismiss()
            }
        }
    }
}
