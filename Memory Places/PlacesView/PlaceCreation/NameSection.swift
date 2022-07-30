/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Ho Le Minh Thach
 ID: s3877980
 Created  date: 29/07/2022
 Last modified: 29/07/2022
 Acknowledgement:
 Learning from Hacking with Swift to implement Authentication, PhotoPicker, and the usage of CoreData
 Hudson, P. (n.d.). The 100 days of Swiftui. Hacking with Swift. Retrieved July 30, 2022, from https://www.hackingwithswift.com/100/swiftui
*/

import SwiftUI

struct NameSection: View {
    private let promptTitle = "Name or Title"
    private let headerTitle = "Name | Title"
    
    @Binding var title: String
    
    var body: some View {
        Section {
            TextField(promptTitle, text: $title)
        } header: {
            Text(headerTitle)
        }
    }
}
