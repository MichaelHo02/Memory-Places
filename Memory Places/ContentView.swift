//
//  ContentView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 16/07/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var places: FetchedResults<Place>
    
    @State private var showingCreationSheet = false
    @State private var searchValue = ""
    
    private let key = "title"
    private let format = "%K CONTAINS[c] %@"
    
    var body: some View {
        NavigationView {
            List {
                PlacesList(
                    filterKey: key, filterValue: searchValue, format: format) { (place: Place) in
                    PlaceDetailView(place: place)
                } label: { (place: Place) in
                    PlaceRowView(title: place.title, isLocked: place.isLocked, isFavorited: place.isFavorited, image: place.wrappedImage)
                } onDelete: { offsets in
                    for offset in offsets {
                        let place = places[offset]
                        moc.delete(place)
                    }
                    saveMOC(moc)
                }
            }
            .navigationTitle("Places")
            .searchable(text: $searchValue, prompt: "Find places by name")
            .toolbar {
                ToolbarContentView(
                    addMockData: addMockData, deleteAll: deleteAll,
                    showingCreationSheet: $showingCreationSheet,
                    count: places.count
                )
            }
            .sheet(isPresented: $showingCreationSheet) { PlaceCreationView()
            }
        }
        .navigationViewStyle(.stack)
    }
    
    private func addMockData() {
        for _ in 1...5 {
            let newPlace = Place(context: moc)
            newPlace.id = UUID()
            newPlace.title = ["Fry", "Anchor", "Henry", "Garry", "Double", "Angle", "Western", "Hanoi", "Taylor"].randomElement()!
            newPlace.about = "This is the best mock place"
            newPlace.address = "123 Google Street"
            newPlace.excitingLevel = Int16(Int.random(in: 1...5))
            newPlace.isFavorited = Bool.random()
            newPlace.isLocked = Bool.random()
            newPlace.image = nil
            saveMOC(moc)
        }
    }
    
    private func deleteAll() {
        for place in places {
            moc.delete(place)
        }
        saveMOC(moc)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
