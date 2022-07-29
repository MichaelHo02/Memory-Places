//
//  MapView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 18/07/2022.
//

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
        self.mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        self.locations = locations
    }
}
