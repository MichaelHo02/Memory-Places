//
//  Util.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 16/07/2022.
//

import Foundation
import CoreData

func generateIcon(_ icon: String, modifier: String, haveModifier: Bool) -> String {
    if (haveModifier) { return icon + modifier }
    return icon
}

func saveMOC(_ context: NSManagedObjectContext) {
    do {
        try context.save()
    } catch {
        context.rollback()
    }
}
