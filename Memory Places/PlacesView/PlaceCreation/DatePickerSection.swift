//
//  DatePickerSection.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 29/07/2022.
//

import SwiftUI

struct DatePickerSection: View {
    @Binding var startDate: Date
    @Binding var endDate: Date
    
    private let promptStartDate = "Start date"
    private let promptEndDate = "End date"
    private let headerDate = "Timeline"
    private let footerDate = "Pick a day when you arrived and when you leaved."
    var body: some View {
        Section {
            DatePicker(promptStartDate, selection: $startDate, displayedComponents: [.date])
            DatePicker(promptEndDate, selection: $endDate, in: startDate..., displayedComponents: [.date])
        } header: {
            Text(headerDate)
        } footer: {
            Text(footerDate)
        }
    }
}
