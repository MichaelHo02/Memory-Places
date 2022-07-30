//
//  PeopleSectionView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 30/07/2022.
//

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
