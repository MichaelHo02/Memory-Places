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
        // create a map with map region
        // add locations annotation items
        Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
            // create a map annotation base on the latitude and longitude
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                // render an icon
                Image(systemName: icon)
                    .frame(width: 32, height: 32, alignment: .top)
                    .foregroundStyle(.red)
            }
        }
        .navigationTitle(navigationTitle)
        .edgesIgnoringSafeArea(.bottom)
    }
    
    /// This init will init the map region
    /// - Parameters:
    ///   - latitude: a double that present the latitude degree
    ///   - longitude: a double that present the longitude degree
    ///   - locations: a list of location that will be rendered in the map as notation
    init(latitude: Double, longitude: Double, locations: [Location]) {
        self.mapRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        )
        self.locations = locations
    }
}
