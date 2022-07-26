//
//  HeadingDetailView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 17/07/2022.
//

import SwiftUI
import MapKit

struct HeadingDetailView: View {
    let image: Image
    let paddingSize: CGFloat
    let title: String
    let address: String
    let latitude: Double
    let longitude: Double
    
    @State var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    
    private let addressIcon = "mappin"
    private let forwardIcon = "chevron.forward"
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            image
                .resizable()
                .scaledToFit()
                .padding(paddingSize)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.title)
                    .foregroundStyle(.primary)
                HStack {
                    NavigationLink {
                        MapView(latitude: latitude, longitude: longitude, locations: [Location(id: UUID(), latitude: latitude, longitude: longitude)])
                    } label: {
                        Label(address, systemImage: addressIcon)
                        Image(systemName: forwardIcon)
                    }
                    Spacer()
                }
                .foregroundStyle(.secondary)
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(.ultraThinMaterial)
            .clipShape(Rectangle())
        }
    }
}
