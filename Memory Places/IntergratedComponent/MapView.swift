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
import MapKit

struct MapView: View {
    @State private var mapRegion:MKCoordinateRegion
    var locations: [Location]

    private let icon = "mappin"
    private let navigationTitle = "Location"
    
    var body: some View {
        Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                Image(systemName: icon)
                    .frame(width: 32, height: 32, alignment: .top)
                    .foregroundStyle(.red)
            }
        }
        .navigationTitle(navigationTitle)
        .edgesIgnoringSafeArea(.bottom)
    }
    
    init(latitude: Double, longitude: Double, locations: [Location]) {
        self.mapRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        )
        self.locations = locations
    }
}
