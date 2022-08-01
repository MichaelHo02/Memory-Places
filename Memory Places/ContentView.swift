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

struct ContentView: View {
    
    /// Get the MOC
    @Environment(\.managedObjectContext) var moc
    
    /// Get all places in core data
    @FetchRequest(sortDescriptors: []) var places: FetchedResults<Place>
    
    /// Read and write values from user defaults
    @AppStorage("showOnBoard") var showOnBoard = true
    
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
    
    /// Show the main view of the app with list of places
    var body: some View {
        NavigationView {
            List {
                // generate a list of navigation view (places)
                // provides label for each navigation view
                // provides action of on delete for the list
                PlacesList(
                    filterKey: key, filterValue: searchValue, format: format) { (place: Place) in
                    PlaceDetailView(place: place)
                } label: { (place: Place) in
                    PlaceRowView(title: place.title, isLocked: place.isLocked, isFavorited: place.isFavorited, image: place.wrappedImage)
                }
            }
            .navigationTitle(title)
            .searchable(text: $searchValue, prompt: promptSearch)
            .toolbar {
                // provide the toolbar for the content view
                ToolbarContentView(
                    addMockData: addMockData,
                    showingCreationSheet: $showingCreationSheet,
                    showingDeleteAllAlert: $showingDeleteAllAlert,
                    count: places.count
                )
            }
            // sheet for creating a place
            .sheet(isPresented: $showingCreationSheet) { PlaceCreationView() }
            // sheet for onboarding view
            .sheet(isPresented: $showOnBoard) { OnBoardView() }
            // alert for deleting all the data
            .alert(alertDeleteTitle, isPresented: $showingDeleteAllAlert) {
                Button(deleteBtnTitle, role: .destructive, action: deleteAll)
            } message: {
                Text(deleteMessage)
            }
        }
        // this will ensure that the toolbar will not corrupt ** important **
        .navigationViewStyle(.stack)
    }
    
    /// This function is read the json files and add to the core data
    private func addMockData() {
        // read the json files
        let jsonPlaces: [JSONPlace] = Bundle.main.decode(fileName)
        // create an object and save to core data
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
    
    /// This function is to delete all the places in core data
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
