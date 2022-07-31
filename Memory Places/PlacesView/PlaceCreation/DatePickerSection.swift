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

struct DatePickerSection: View {
    @Binding var startDate: Date
    @Binding var endDate: Date
    
    private let promptStartDate = "Start date"
    private let promptEndDate = "End date"
    private let headerDate = "Timeline"
    private let footerDate = "Pick a day when you arrived and when you leaved."
    
    var body: some View {
        Section {
            DatePicker(
                promptStartDate,
                selection: $startDate,
                displayedComponents: [.date]
            )
            // only pick date from startDate forward
            DatePicker(
                promptEndDate,
                selection: $endDate,
                in: startDate...,
                displayedComponents: [.date]
            )
        } header: {
            Text(headerDate)
        } footer: {
            Text(footerDate)
        }
    }
}
