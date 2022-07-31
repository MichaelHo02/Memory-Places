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

struct ListPeopleView: View {
    let people: [String]

    private let titlePeople = "People"
    private let iconPerson = "person"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(titlePeople)
                .font(.title2)
            Divider()
            // iterate people to display each person
            ForEach(people, id: \.self) { person in
                HStack {
                    Image(systemName: iconPerson)
                        .foregroundColor(.accentColor)
                    Text(person)
                    Spacer()
                }
                Divider()
            }
        }
    }
}
