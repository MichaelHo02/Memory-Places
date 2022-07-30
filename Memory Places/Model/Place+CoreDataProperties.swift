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

import Foundation
import CoreData


extension Place {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Place> {
        return NSFetchRequest<Place>(entityName: "Place")
    }

    @NSManaged public var about: String
    @NSManaged public var address: String
    @NSManaged public var rate: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var image: Data?
    @NSManaged public var isFavorited: Bool
    @NSManaged public var isLocked: Bool
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var title: String
    @NSManaged public var startDate: Date?
    @NSManaged public var endDate: Date?
    @NSManaged public var people: [String]

}

extension Place : Identifiable {

}
