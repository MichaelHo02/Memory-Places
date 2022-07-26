//
//  AddressSelectionView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 17/07/2022.
//

import SwiftUI
import MapKit

struct AddressSelectionView: View {
    @State var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 10, longitude: 106), span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50))
    
    @Binding var address: String
    @Binding var locations: [Location]
    
    private let iconMap = "mappin"
    private var iconAddRemoveLocation: String {
        locations.count == 0 ? "plus" : "xmark"
    }
    
    var body: some View {
        Section {
            TextField("Address", text: $address)
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
                    .fill(.red)
                    .opacity(0.5)
                    .frame(width: 16, height: 16)
                
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
