//
//  ExtensionModel.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 25/07/2022.
//

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
