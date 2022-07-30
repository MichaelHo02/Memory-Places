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

@main
struct Memory_PlacesApp: App {
    
    /// Init the data controller that responsible for managing the data in core data
    @StateObject private var dataController = DataController()
    
    /// Display the main scene and storing the view context to the managed object context
    /// This will help the app to access the managedObjectContext (MOC) from any children inside ContentView
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(
                    \.managedObjectContext,
                     dataController.persistentContainer.viewContext
                )
        }
    }
}
