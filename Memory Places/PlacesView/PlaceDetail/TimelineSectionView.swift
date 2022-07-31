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

struct TimelineSectionView: View {
    let startDate: Date?
    let endDate: Date?
    
    private let addressIcon = "mappin"
    private let titleTimeline = "Timeline"
    private let notAvailableText = "N/A"
    private let iconArrow = "arrow.right"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(titleTimeline)
                .font(.title2)
            HStack {
                Text(startDate?.formatted(.dateTime.day().month().year()) ?? notAvailableText)
                Spacer()
                Image(systemName: iconArrow)
                Spacer()
                Text(endDate?.formatted(.dateTime.day().month().year()) ?? notAvailableText)
            }
        }
    }
}
