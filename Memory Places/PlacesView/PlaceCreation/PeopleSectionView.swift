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

struct PeopleSectionView: View {
    @Binding var attendees: [String]
    @State var newPerson = ""
    
    private let icon = "person"
    private let promptTextField = "New Attendee"
    private let addIcon = "plus.circle.fill"
    private let header = "Attendees"
    
    var body: some View {
        Section {
            // create a list of attendees
            ForEach(attendees, id: \.self) { attendee in
                HStack {
                    Image(systemName: icon)
                    Text(attendee)
                }
            }
            .onDelete { indices in
                attendees.remove(atOffsets: indices)
            }
            // create an input field to create attendees
            HStack {
                TextField(promptTextField, text: $newPerson)
                    .onSubmit(addPerson)
                Button(action: addPerson) {
                    Image(systemName: addIcon)
                }
                .disabled(newPerson.trim().isEmpty)
            }
        } header: {
            Text(header)
        }
    }
    
    /// This function will create a person base on the input in text field
    private func addPerson() {
        // if the trimmed string is empty then do not create new person
        if newPerson.trim().isEmpty { return }
        withAnimation {
            let attendee = newPerson
            attendees.append(attendee)
            newPerson = ""
        }
    }
}
