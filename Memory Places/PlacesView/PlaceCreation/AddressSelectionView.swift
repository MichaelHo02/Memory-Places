//
//  AddressSelectionView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 17/07/2022.
//

import SwiftUI
import MapKit

struct AddressSelectionView: View {
    @Binding var address: String
    @Binding var mapRegion: MKCoordinateRegion
    @Binding var locations: [Location]
    
    private let iconMap = "mappin"
    private var iconAddRemoveLocation: String {
        locations.count == 0 ? "plus" : "xmark"
    }
    
    var body: some View {
        Section {
            TextField("Place's Address", text: $address)
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
                    .opacity(0.3)
                    .frame(width: 32, height: 32)
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
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
        }
    }
}
