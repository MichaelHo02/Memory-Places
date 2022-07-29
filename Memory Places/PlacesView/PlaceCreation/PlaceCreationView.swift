//
//  PlaceCreationView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 17/07/2022.
//

import SwiftUI
import MapKit

struct PlaceCreationView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @FocusState private var isFocusKeyboard

    
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
    
    private let headerAbout = "About"
    private let footerAbout = "Write down all of the memories about this place."
    
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
                
                Section { TextEditor(text: $about).focused($isFocusKeyboard) } header: {
                    Text(headerAbout)
                } footer: {
                    Text(footerAbout)
                }
                
                AddressSelectionView(
                    address: $address, locations: $locations
                ).focused($isFocusKeyboard)
            }
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarPlaceCreationView(
                    dismiss: _dismiss, saveItem: saveItem, allowSubmit: allowSubmit
                )
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button(buttonTitle) {
                        isFocusKeyboard = false
                    }
                }
            }
            .onAppear(perform: loadImage)
            .sheet(isPresented: $showingImagePicker) { ImagePicker(image: $inputImage) }
            .onChange(of: inputImage) { _ in loadImage() }
        }
        .onSubmit {
            isFocusKeyboard = false
        }
    }
    
    private func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
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
        newPlace.image = inputImage?.jpegData(compressionQuality: 0.5)
        if let location = locations.first {
            newPlace.latitude = location.latitude
            newPlace.longitude = location.longitude
        }
        saveMOC(moc)
        dismiss()
    }
    
    private func allowSubmit() -> Bool {
        title.isEmpty || address.isEmpty || about.isEmpty || locations.isEmpty || people.isEmpty
    }
}

struct PlaceCreationView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceCreationView()
    }
}
