/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Ho Le Minh Thach
 ID: s3877980
 Created  date: 28/07/2022
 Last modified: 28/07/2022
 Acknowledgement:
 Learning from Hacking with Swift to implement Authentication, PhotoPicker, and the usage of CoreData
 Hudson, P. (n.d.). The 100 days of Swiftui. Hacking with Swift. Retrieved July 30, 2022, from https://www.hackingwithswift.com/100/swiftui
*/

import Foundation

/// This struct will responsible as a Data Transfer Object
/// It will store the data from json files and create object in core data
struct JSONPlace: Codable {
    let title: String
    let startDate: Date
    let endDate: Date
    let about: String
    let address: String
    let rate: Int
    let isFavorited: Bool
    let isLocked: Bool
    let people: [String]
    let longitude: Double
    let latitude: Double
}
