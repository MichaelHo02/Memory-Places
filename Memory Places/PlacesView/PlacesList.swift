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
import CoreData

/// This view is to display a list of navigation link base on the query and the corresponding data type
struct PlacesList<T: NSManagedObject, Destination: View, Label: View>: View {
    @Environment(\.managedObjectContext) var moc
    
    /// fetchRequest will store all the objects as a result from a query
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    /// This view is to display a view after you tap on the navigation link
    let destination: (T) -> Destination
    
    /// This view is to display a view for navigation link
    let label: (T) -> Label
    
    /// This view is to render the list of navigation link
    var body: some View {
        // iterate through the result
        ForEach(fetchRequest, id: \.self) { item in
            // create a navigation link with destination view and the label view
            NavigationLink { destination(item) } label: { label(item) }
        }
        // perform onDelete function when user remove the item in the list
        .onDelete { offsets in
            for offset in offsets {
                let place = fetchRequest[offset]
                moc.delete(place)
            }
            saveMOC(moc)
        }
    }
    
    /// Init the value of the fetchRequest and also provide views for destination, label, and function to delete items
    /// - Parameters:
    ///   - filterKey: A string that present the key attribute of the object that need query
    ///   - filterValue: A string that present the value that the key attribute need to match in the query
    ///   - format: A string that present the query which will combine key and value filter to query
    ///   - destination: The destination view that render after user tap on the navigation link
    ///   - label: The label view that render when display the navigation link view
    ///   - onDelete: The function that will handle the removing of an item in the list
    init(
        filterKey: String,
        filterValue: String,
        format: String,
        @ViewBuilder destination: @escaping (T) -> Destination,
        @ViewBuilder label: @escaping (T) -> Label
    ) {
        // if the filter value is empty mean that there is no search
        // then get all the corresponding object in core data
        if filterValue.isEmpty {
            _fetchRequest = FetchRequest<T>(sortDescriptors: [])
        } else {
            // get the objects that match the query
            _fetchRequest = FetchRequest<T>(
                sortDescriptors: [], predicate: NSPredicate(format: format, filterKey, filterValue)
            )
        }
        self.destination = destination
        self.label = label
    }
}
