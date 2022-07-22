//
//  DataController.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 16/07/2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let persistentContainer = NSPersistentContainer(name: "Model")
        
    init() {
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
    }
}
