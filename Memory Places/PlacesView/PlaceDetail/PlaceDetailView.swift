//
//  PlaceDetailView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 16/07/2022.
//

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
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{ ToolbarDetailView(
            isLocked: $isLocked,
            showingDeleteAlert: $showingDeleteAlert,
            isFavorited: $isFavorited
        )}
        .onAppear(perform: onAppear)
        .onDisappear(perform: onDisappear)
        .alert("Non-support Authentication", isPresented: $showingNonSupportAuthentication) {} message: {
            Text(nonSupportAuthenticationMsg)
        }
        .alert("Fail Authentication", isPresented: $showingFailAuthenticationAlert) {
            Button("Cancel", role: .cancel) {
                presentationMode.wrappedValue.dismiss()
            }
        }
        .alert("Delete Place", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deletePlace)
        } message: {
            Text(deleteMsg)
        }
    }
    
    private func authenticate() {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Authenticate permision will give you protection feature"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
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
    }
}
