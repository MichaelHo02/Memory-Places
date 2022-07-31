/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Ho Le Minh Thach
 ID: s3877980
 Created  date: 26/07/2022
 Last modified: 26/07/2022
 Acknowledgement:
 Learning from Hacking with Swift to implement Authentication, PhotoPicker, and the usage of CoreData
 Hudson, P. (n.d.). The 100 days of Swiftui. Hacking with Swift. Retrieved July 30, 2022, from https://www.hackingwithswift.com/100/swiftui
*/

import SwiftUI

struct AboutSection: View {
    @Binding var about: String
    
    private let headerAbout = "About"
    private let footerAbout = "Write down all of the memories about this place."
    
    var body: some View {
        Section {
            TextEditor(text: $about)
        } header: {
            Text(headerAbout)
        } footer: {
            Text(footerAbout)
        }
    }
}
