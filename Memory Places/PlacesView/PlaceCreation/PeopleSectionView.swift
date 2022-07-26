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
    
    var body: some View {
        Section {
            ForEach(attendees, id: \.self) { attendee in
                HStack {
                    Image(systemName: "person")
                    Text(attendee)
                }
            }
            .onDelete { indices in
                attendees.remove(atOffsets: indices)
            }
            HStack {
                TextField("New Attendee", text: $newPerson)
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
                    Image(systemName: "plus.circle.fill")
                }
                .disabled(newPerson.isEmpty)
            }
        } header: {
            Text("Attendees")
        }
    }
}
