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

struct PlaceDetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var place: Place
    @State private var showingNonSupportAuthentication = false
    @State private var showingFailAuthenticationAlert = false
    @State private var isValidAuthentication = false
    @State private var isFavorited = false
    @State private var isLocked = false
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
            if isValidAuthentication {
                HeadingDetailView(
                    image: place.wrappedImage,
                    paddingSize: place.image == nil ? 20 : 0,
                    title: place.title,
                    address: place.address,
                    latitude: place.latitude,
                    longitude: place.longitude
                )
                BodyDetailView(title: place.title, rate: Int(place.rate), startDate: place.startDate, endDate: place.endDate, people: place.people, about: place.about, longitude: place.longitude, latitude: place.latitude, address: place.address)
            }
        }
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{ ToolbarDetailView(
            isLocked: $isLocked,
            showingDeleteAlert: $showingDeleteAlert,
            isFavorited: $isFavorited
        )}
        .onAppear(perform: onAppear)
        .onDisappear(perform: onDisappear)
        .alert(alertMesageNonSupportAuth, isPresented: $showingNonSupportAuthentication) {} message: {
            Text(nonSupportAuthenticationMsg)
        }
        .alert(alertMesageNonSupportAuth, isPresented: $showingFailAuthenticationAlert) {
            Button(cancelTitle, role: .cancel) {
                presentationMode.wrappedValue.dismiss()
            }
        }
        .alert(alertMessageDelete, isPresented: $showingDeleteAlert) {
            Button(deleteTitle, role: .destructive, action: deletePlace)
        } message: {
            Text(deleteMsg)
        }
    }
    
    private func authenticate() {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Authenticate permision will give you protection feature"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, error in
                if success {
                    isValidAuthentication = true
                } else {
                    showingFailAuthenticationAlert = true
                }
            }
        } else {
            isValidAuthentication = true
            showingNonSupportAuthentication = true
        }
    }
    
    private func onAppear() {
        isFavorited = place.isFavorited
        isLocked = place.isLocked
        
        if isLocked && !isValidAuthentication {
            authenticate()
        } else {
            isValidAuthentication = true
        }
    }
    
    private func onDisappear() {
        if isDelete { return }
        place.isFavorited = isFavorited
        place.isLocked = isLocked
        saveMOC(moc)
    }
    
    private func deletePlace() {
        isDelete = true
        moc.delete(place)
        saveMOC(moc)
        presentationMode.wrappedValue.dismiss()
    }
}
