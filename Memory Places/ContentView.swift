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
    
    
//     appstorage scenestorage userdefault
//    @AppStorage("showOnBoard") var showOnBoard = true
    @State var showOnBoard = true
    
    @State private var showingCreationSheet = false
    @State private var showingDeleteAllAlert = false
    @State private var searchValue = ""
    
    private let key = "title"
    private let format = "%K CONTAINS[c] %@"
    
    private let promptSearch = "find places by name"
    private let title = "Places"
    private let fileName = "places.json"
    
    private let alertDeleteTitle = "Delete All Places"
    private let deleteBtnTitle = "Delete"
    private let deleteMessage = "By clicking delete, all of the data will be clear. There will be no undo!"
    
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
            .navigationTitle(title)
            .searchable(text: $searchValue, prompt: promptSearch)
            .toolbar {
                ToolbarContentView(
                    addMockData: addMockData,
                    showingCreationSheet: $showingCreationSheet,
                    showingDeleteAllAlert: $showingDeleteAllAlert,
                    count: places.count
                )
            }
            .sheet(isPresented: $showingCreationSheet) { PlaceCreationView() }
            .sheet(isPresented: $showOnBoard) { OnBoardView() }
            .alert(alertDeleteTitle, isPresented: $showingDeleteAllAlert) {
                Button("Cancel", role: .cancel) {} .tint(.accentColor)
                Button(deleteBtnTitle, role: .destructive, action: deleteAll)
            } message: {
                Text(deleteMessage)
            }
        }
        .navigationViewStyle(.stack)
    }
    
    private func addMockData() {
        let jsonPlaces: [JSONPlace] = Bundle.main.decode(fileName)
        for jsonPlace in jsonPlaces {
            let newPlace = Place(context: moc)
            newPlace.id = UUID()
            newPlace.title = jsonPlace.title
            newPlace.startDate = jsonPlace.startDate
            newPlace.endDate = jsonPlace.endDate
            newPlace.about = jsonPlace.about
            newPlace.address = jsonPlace.address
            newPlace.rate = Int16(jsonPlace.rate)
            newPlace.isFavorited = jsonPlace.isFavorited
            newPlace.isLocked = jsonPlace.isLocked
            newPlace.image = nil
            newPlace.people = jsonPlace.people
            newPlace.longitude = jsonPlace.longitude
            newPlace.latitude = jsonPlace.latitude
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
