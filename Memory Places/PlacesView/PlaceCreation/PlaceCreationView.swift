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
    @State private var address = ""
    @State private var about = ""
    @State private var excitedLevel = 3
    @State private var isFavorited = false
    @State private var isLocked = false
    
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    
    @State private var locations = [Location]()

    
    private var promptTitle = "Place Title"
    
    var body: some View {
        NavigationView {
            Form {
                Section { TextField(promptTitle, text: $title).focused($isFocusKeyboard) }
                GetImageSection(image: $image, showingImagePicker: $showingImagePicker)
                AdditionalSectionView(
                    excitedLevel: $excitedLevel, isLocked: $isLocked, isFavorited: $isFavorited
                )
                Section { TextEditor(text: $about).focused($isFocusKeyboard) } header: {
                    Text("Description")
                } footer: {
                    Text("Write down all of the memory about this place.")
                }
                AddressSelectionView(
                    address: $address, mapRegion: $mapRegion, locations: $locations
                ).focused($isFocusKeyboard)
            }
            .navigationTitle("New Place")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarPlaceCreationView(
                    dismiss: _dismiss, saveItem: saveItem, allowSubmit: allowSubmit
                )
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isFocusKeyboard = false
                    }
                }
            }
            .onAppear(perform: loadImage)
            .sheet(isPresented: $showingImagePicker) { ImagePicker(image: $inputImage) }
            .onChange(of: inputImage) { _ in loadImage() }
        }
    }
    
    private func loadImage() {
        guard let inputImage = inputImage else {
            return
        }
        image = Image(uiImage: inputImage)
    }
    
    private func saveItem() {
        let newPlace = Place(context: moc)
        newPlace.id = UUID()
        newPlace.title = title
        newPlace.address = address
        newPlace.about = about
        newPlace.excitingLevel = Int16(excitedLevel)
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
        title.isEmpty || address.isEmpty || about.isEmpty || locations.isEmpty
    }
}

struct PlaceCreationView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceCreationView()
    }
}
