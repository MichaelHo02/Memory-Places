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

struct PlacesList<T: NSManagedObject, Destination: View, Label: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    let destination: (T) -> Destination
    let label: (T) -> Label
    let onDelete: (IndexSet) -> Void
    
    var body: some View {
        ForEach(fetchRequest, id: \.self) { item in
            NavigationLink { destination(item) } label: { label(item) }
        }
        .onDelete(perform: onDelete)
    }
    
    init(
        filterKey: String,
        filterValue: String,
        format: String,
        @ViewBuilder destination: @escaping (T) -> Destination,
        @ViewBuilder label: @escaping (T) -> Label,
        onDelete: @escaping (IndexSet) -> Void
    ) {
        if filterValue.isEmpty {
            _fetchRequest = FetchRequest<T>(sortDescriptors: [])
        } else {
            _fetchRequest = FetchRequest<T>(
                sortDescriptors: [], predicate: NSPredicate(format: format, filterKey, filterValue)
            )
        }
        self.destination = destination
        self.label = label
        self.onDelete = onDelete
    }
}
