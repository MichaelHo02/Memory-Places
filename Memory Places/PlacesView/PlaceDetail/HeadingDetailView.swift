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

struct HeadingDetailView: View {
    let image: Image
    let paddingSize: CGFloat
    let title: String
    let address: String
    let latitude: Double
    let longitude: Double
    
    private let addressIcon = "mappin"
    private let forwardIcon = "chevron.forward"
    private let messageViewMap = "View on map"
    
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
                        Image(systemName: addressIcon)
                        Text(messageViewMap)
                        Image(systemName: forwardIcon)
                    }
                    Spacer(minLength: 0)
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
