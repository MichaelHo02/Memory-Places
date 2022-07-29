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
    let startDate: Date?
    let endDate: Date?
    let people: [String]
    let about: String
    
    let longitude: Double
    let latitude: Double
    let address: String
    
    private let addressIcon = "mappin"
    private let forwardIcon = "chevron.forward"
    
    private let titleRating = "Rating"
    private let titleLocation = "Location"
    private let titleTimeline = "Timeline"
    private let titlePeople = "People"
    
    private let notAvailableText = "N/A"
    private let iconArrow = "arrow.right"
    private let iconPerson = "person"
    private let iconHeart = "heart"
    private let iconHeartAlternative = "heart.fill"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            HStack {
                Text(titleRating)
                    .font(.title2)
                Spacer()
                RateView(
                    rating: .constant(rate), maximumRating: 5,
                    offImage: Image(systemName: iconHeart),
                    onImage: Image(systemName: iconHeartAlternative)
                )
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(titleRating)
                    .font(.title2)
                
                Text(address)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(titleTimeline)
                    .font(.title2)
                HStack {
                    Text(startDate?.formatted(.dateTime.day().month().year()) ?? notAvailableText)
                    Spacer()
                    Image(systemName: iconArrow)
                    Spacer()
                    Text(endDate?.formatted(.dateTime.day().month().year()) ?? notAvailableText)
                }
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(titlePeople)
                    .font(.title2)
                Divider()
                ForEach(people, id: \.self) { person in
                    HStack {
                        Image(systemName: iconPerson)
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
