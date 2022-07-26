//
//  Place+CoreDataProperties.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 26/07/2022.
//
//

import Foundation
import CoreData


extension Place {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Place> {
        return NSFetchRequest<Place>(entityName: "Place")
    }

    @NSManaged public var about: String
    @NSManaged public var address: String
    @NSManaged public var rate: Int16
    @NSManaged public var id: UUID
    @NSManaged public var image: Data?
    @NSManaged public var isFavorited: Bool
    @NSManaged public var isLocked: Bool
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var title: String
    @NSManaged public var startDate: Date
    @NSManaged public var endDate: Date

}

extension Place : Identifiable {

}
