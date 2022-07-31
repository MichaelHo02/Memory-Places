/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Ho Le Minh Thach
 ID: s3877980
 Created  date: 17/07/2022
 Last modified: 17/07/2022
 Acknowledgement:
 Learning from Hacking with Swift to implement Authentication, PhotoPicker, and the usage of CoreData
 Hudson, P. (n.d.). The 100 days of Swiftui. Hacking with Swift. Retrieved July 30, 2022, from https://www.hackingwithswift.com/100/swiftui
*/

import SwiftUI
import MapKit

struct PlaceCreationView: View {
    @Environment(\.managedObjectContext) var moc
    
    /// The dismiss will help go back to the parent view
    @Environment(\.dismiss) var dismiss
    
    /// The FocusState  to track which view recieves user input
    /// If the value is true then the view is focus else false then nothing is focused
    @FocusState private var isFocusKeyboard

    
    /// Provide default config
    @State private var title = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var address = ""
    @State private var about = ""
    @State private var rate = 3
    @State private var isFavorited = false
    @State private var isLocked = false
    @State private var people = [String]()
    
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    @State private var locations = [Location]()
    
    private let navigationTitle = "New Place"
    private let buttonTitle = "Done"
    
    var body: some View {
        NavigationView {
            Form {
                NameSection(title: $title)
                    .focused($isFocusKeyboard)
                
                DatePickerSection(startDate: $startDate, endDate: $endDate)
                
                GetImageSection(image: $image, showingImagePicker: $showingImagePicker)
                
                AdditionalSectionView(rate: $rate, isLocked: $isLocked, isFavorited: $isFavorited)
                
                PeopleSectionView(attendees: $people)
                    .focused($isFocusKeyboard)
                
                AboutSection(about: $about)
                    .focused($isFocusKeyboard)
                
                AddressSelectionView(address: $address, locations: $locations)
                    .focused($isFocusKeyboard)
            }
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // provide toolbar for creation view
                ToolbarPlaceCreationView(
                    dismiss: _dismiss, saveItem: saveItem, allowSubmit: allowSubmit
                )
                
                // provide button next to keyboard to dismiss the keyboard
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button(buttonTitle) {
                        isFocusKeyboard = false
                    }
                }
            }
            .onAppear(perform: loadImage)
            // show the sheet for picking image
            .sheet(isPresented: $showingImagePicker) { ImagePicker(image: $inputImage) }
            // when there is new change in input image then update the image
            .onChange(of: inputImage) { _ in loadImage() }
        }
        // when submit then dismiss keyboard
        .onSubmit { isFocusKeyboard = false }
    }
    
    /// This function is to get the input image and add to the render view
    private func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    /// This function is to save the item (place) into core data
    private func saveItem() {
        let newPlace = Place(context: moc)
        newPlace.id = UUID()
        newPlace.title = title
        newPlace.startDate = startDate
        newPlace.endDate = endDate
        newPlace.people = people
        newPlace.address = address
        newPlace.about = about
        newPlace.rate = Int16(rate)
        newPlace.isFavorited = isFavorited
        newPlace.isLocked = isLocked
        // compress the jpeg into binary data
        newPlace.image = inputImage?.jpegData(compressionQuality: 0.5)
        if let location = locations.first {
            newPlace.latitude = location.latitude
            newPlace.longitude = location.longitude
        }
        saveMOC(moc)
        dismiss()
    }
    
    /// This function is to see if the submit is allowed or not
    /// - Returns: Boolean true -> all the fields are filled & false -> all the fields are not filled
    private func allowSubmit() -> Bool {
        title.trim().isEmpty ||
        address.trim().isEmpty ||
        about.trim().isEmpty ||
        locations.isEmpty ||
        people.isEmpty
    }
}

struct PlaceCreationView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceCreationView()
    }
}
