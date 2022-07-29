//
//  PeopleSectionView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 26/07/2022.
//

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
            ForEach(attendees, id: \.self) { attendee in
                HStack {
                    Image(systemName: icon)
                    Text(attendee)
                }
            }
            .onDelete { indices in
                attendees.remove(atOffsets: indices)
            }
            HStack {
                TextField(promptTextField, text: $newPerson)
                    .onSubmit {
                        if newPerson.isEmpty { return }
                        withAnimation {
                            let attendee = newPerson
                            attendees.append(attendee)
                            newPerson = ""
                        }
                    }
                Button {
                    withAnimation {
                        let attendee = newPerson
                        attendees.append(attendee)
                        newPerson = ""
                    }
                } label: {
                    Image(systemName: addIcon)
                }
                .disabled(newPerson.isEmpty)
            }
        } header: {
            Text(header)
        }
    }
}
