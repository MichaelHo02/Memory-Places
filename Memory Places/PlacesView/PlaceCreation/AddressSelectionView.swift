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

struct AddressSelectionView: View {
    
    /// Set map region to be center of Vietnam as default value
    @State var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 10, longitude: 106), span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50)
    )
    
    @Binding var address: String
    @Binding var locations: [Location]
    
    private let iconMap = "mappin"
    private var iconAddRemoveLocation: String {
        locations.count == 0 ? "plus" : "xmark"
    }
    
    private let promptAddress = "Enter full address"
    private let headerAddress = "Address"
    
    var body: some View {
        Section {
            TextField(promptAddress, text: $address)
            ZStack {
                Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                        Image(systemName: iconMap)
                            .frame(width: 32, height: 32, alignment: .top)
                            .foregroundStyle(.red)
                    }
                }
                .frame(minHeight: 400)
                
                Circle()
                    .fill(.blue)
                    .frame(width: 16, height: 16)
                    .opacity(0.5)
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            // if there is no location do add action
                            // else do remove action
                            if locations.count == 0 {
                                let newLocation = Location(
                                    id: UUID(),
                                    latitude: mapRegion.center.latitude,
                                    longitude: mapRegion.center.longitude
                                )
                                locations.append(newLocation)
                            } else {
                                locations.removeAll()
                            }
                        } label: {
                            Image(systemName: iconAddRemoveLocation)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.secondary)
                        .padding()
                        .font(.title)
                    }
                }
            }
        } header: {
            Text(headerAddress)
        }
    }
}
