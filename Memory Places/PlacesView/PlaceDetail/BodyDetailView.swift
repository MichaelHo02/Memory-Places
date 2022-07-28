//
//  BodyDetailView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 17/07/2022.
//

import SwiftUI

struct BodyDetailView: View {
    let title: String
    let rate: Int
    let startDate: Date
    let endDate: Date
    let people: [String]
    let about: String
    
    let longitude: Double
    let latitude: Double
    let address: String
    
    private let addressIcon = "mappin"
    private let forwardIcon = "chevron.forward"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            HStack {
                Text("Rating")
                    .font(.title2)
                Spacer()
                RateView(rating: .constant(rate), maximumRating: 5, offImage: Image(systemName: "heart"), onImage: Image(systemName: "heart.fill"))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Location")
                    .font(.title2)
                
                Text(address)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Timeline")
                    .font(.title2)
                HStack {
                    Text("\(startDate.formatted(.dateTime.day().month().year()))")
                    Spacer()
                    Image(systemName: "arrow.right")
                    Spacer()
                    Text("\(endDate.formatted(.dateTime.day().month().year()))")
                }
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("People")
                    .font(.title2)
                Divider()
                ForEach(people, id: \.self) { person in
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.mint)
                        Text(person)
                        Spacer()
                    }
                    Divider()
                }
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("About \(title)")
                    .font(.title2)
                Divider()
                Text(about)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
