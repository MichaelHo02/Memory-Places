/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Ho Le Minh Thach
 ID: s3877980
 Created  date: 16/07/2022
 Last modified: 16/07/2022
 Acknowledgement:
 Learning from Hacking with Swift to implement Authentication, PhotoPicker, and the usage of CoreData
 Hudson, P. (n.d.). The 100 days of Swiftui. Hacking with Swift. Retrieved July 30, 2022, from https://www.hackingwithswift.com/100/swiftui
*/

import SwiftUI

struct BodyDetailView: View {
    let title: String
    let rate: Int
    let startDate: Date?
    let endDate: Date?
    let people: [String]
    let about: String
    
    let longitude: Double
    let latitude: Double
    let address: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            RatingSectionView(rate: rate)
            
            LocationSectionView(address: address)
            
            TimelineSectionView(startDate: startDate, endDate: endDate)
            
            ListPeopleView(people: people)
            
            AboutSectionView(title: title, about: about)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
