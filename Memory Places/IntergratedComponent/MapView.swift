//
//  MapView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 18/07/2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 0))
    var locations: [Location]

    
    var body: some View {
        Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                Image(systemName: "mappin")
                    .frame(width: 32, height: 32, alignment: .top)
                    .foregroundStyle(.red)
            }
        }
        .navigationTitle("Location")
        .edgesIgnoringSafeArea(.bottom)
    }
}
