/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Ho Le Minh Thach
 ID: s3877980
 Created  date: 25/07/2022
 Last modified: 25/07/2022
 Acknowledgement:
 Learning from Hacking with Swift to implement Authentication, PhotoPicker, and the usage of CoreData
 Hudson, P. (n.d.). The 100 days of Swiftui. Hacking with Swift. Retrieved July 30, 2022, from https://www.hackingwithswift.com/100/swiftui
*/

import Foundation
import CoreData
import SwiftUI

extension Place {
    var wrappedImage: Image {
        let nilImage = "photo"
        
        if let imageData = image {
            if let uiImage = UIImage(data: imageData) {
                return Image(uiImage: uiImage)
            }
        }
        return Image(systemName: nilImage)
    }
}
