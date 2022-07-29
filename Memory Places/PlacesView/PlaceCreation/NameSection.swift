//
//  NameSection.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 29/07/2022.
//

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
