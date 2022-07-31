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

class DataController: ObservableObject {
    
    /// Prepare Core Data to load Model
    let persistentContainer = NSPersistentContainer(name: "Model")
        
    init() {
        // load the data model (core data can see all the information)
        persistentContainer.loadPersistentStores { description, error in
            // if there is any error then stop the app
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
    }
}
