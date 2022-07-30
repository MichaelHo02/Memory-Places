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
import LocalAuthentication

/// This view show the detail of a place
struct PlaceDetailView: View {
    
    /// Get the MOC to manage the object places
    @Environment(\.managedObjectContext) var moc
    
    /// Get the presentationMode to close the sheet or return back to the parent view
    @Environment(\.presentationMode) var presentationMode
    
    /// The injected place object from the parent view (this is an instance in the list return by core data)
    @ObservedObject var place: Place
    
    /// State to manage the alert
    @State private var showingNonSupportAuthentication = false
    @State private var showingFailAuthenticationAlert = false
    
    /// State to manage the status of authentication, favorited, locked
    @State private var isValidAuthentication = false
    @State private var isFavorited = false
    @State private var isLocked = false
    
    
    /// State that manage the status of showing delete alert and item is deleted or not
    @State private var showingDeleteAlert = false
    @State private var isDelete = false
    
    private let nonSupportAuthenticationMsg = """
    Your device do not support TouchID or FaceID.
    If you have TouchId or FaceID please enrolled it!
    Else you cannot authenticate on this device. Sorry!
    """
    private let deleteMsg = "Are you sure?"
    private let alertMesageNonSupportAuth = "Non-support Authenticaiton"
    private let alertMessageFailAuth = "Fail Authentication"
    private let cancelTitle = "Cancel"
    private let alertMessageDelete = "Delete Place"
    private let deleteTitle = "Delete"
    private let navigationTitle = "Details"
    
    var body: some View {
        ScrollView {
            // If the authentication is valid then show detail view of places
            if isValidAuthentication {
                // show the heading
                HeadingDetailView(
                    image: place.wrappedImage,
                    paddingSize: place.image == nil ? 20 : 0,
                    title: place.title,
                    latitude: place.latitude,
                    longitude: place.longitude
                )
                // show the body
                BodyDetailView(
                    title: place.title,
                    rate: Int(place.rate),
                    startDate: place.startDate,
                    endDate: place.endDate,
                    people: place.people,
                    about: place.about,
                    longitude: place.longitude,
                    latitude: place.latitude,
                    address: place.address
                )
            }
        }
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        // display the toolbar for detail view
        .toolbar{ ToolbarDetailView(
            isLocked: $isLocked,
            showingDeleteAlert: $showingDeleteAlert,
            isFavorited: $isFavorited
        )}
        .onAppear(perform: onAppear)
        .onDisappear(perform: onDisappear)
        // show alert for non support authentication device
        .alert(alertMesageNonSupportAuth, isPresented: $showingNonSupportAuthentication) {} message: {
            Text(nonSupportAuthenticationMsg)
        }
        // show alert for fail authentication
        .alert(alertMessageFailAuth, isPresented: $showingFailAuthenticationAlert) {
            Button(cancelTitle, role: .cancel) {
                // return to the parent view
                presentationMode.wrappedValue.dismiss()
            }
        }
        // show the alert for delete the item
        .alert(alertMessageDelete, isPresented: $showingDeleteAlert) {
            Button(deleteTitle, role: .destructive, action: deletePlace)
        } message: {
            Text(deleteMsg)
        }
    }
    
    /// This function will check for authentication
    private func authenticate() {
        // get the Local Authentication
        let context = LAContext()
        var error: NSError?
        
        // check if the device support authentication
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Authenticate permision will give you protection feature"
            // ask the user for permission to authenticate with touchID
            // faceID is config in the .xcodeproj
            // then authenticate if possible
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, error in
                // success authentication
                if success {
                    isValidAuthentication = true
                } else {
                    // fail authentication
                    showingFailAuthenticationAlert = true
                }
            }
        } else {
            // non supportive device to authenticate
            // allow the user to see the content
            isValidAuthentication = true
            // but show the non support authentication alert
            showingNonSupportAuthentication = true
        }
    }
    
    /// This function will check for authentication when first render the view
    private func onAppear() {
        isFavorited = place.isFavorited
        isLocked = place.isLocked
        
        if isLocked && !isValidAuthentication {
            authenticate()
        } else {
            isValidAuthentication = true
        }
    }
    
    /// This function will update the object place when exist the view
    private func onDisappear() {
        if isDelete { return }
        place.isFavorited = isFavorited
        place.isLocked = isLocked
        saveMOC(moc)
    }
    
    /// This function will delete the place
    private func deletePlace() {
        isDelete = true
        moc.delete(place)
        saveMOC(moc)
        presentationMode.wrappedValue.dismiss()
    }
}
