//
//  Place+CoreDataProperties.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 16/07/2022.
//
//

import Foundation
import CoreData
import SwiftUI


extension Place {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Place> {
        return NSFetchRequest<Place>(entityName: "Place")
    }

    @NSManaged public var id: UUID
    @NSManaged public var image: Data?
    @NSManaged public var isLocked: Bool
    @NSManaged public var isFavorited: Bool
    @NSManaged public var title: String
    @NSManaged public var excitingLevel: Int16
    @NSManaged public var address: String
    @NSManaged public var about: String
    @NSManaged public var longitude: Double
    @NSManaged public var latitude: Double

}

extension Place : Identifiable {

}

extension Place {
    var wrappedImage: Image {
        if let imageData = image {
            if let uiImage = UIImage(data: imageData) {
                return Image(uiImage: uiImage)
            }
        }
        return Image(systemName: "photo")
    }
}
