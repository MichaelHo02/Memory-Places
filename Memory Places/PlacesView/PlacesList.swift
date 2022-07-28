//
//  PlacesList.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 16/07/2022.
//

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
