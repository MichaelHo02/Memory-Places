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
    let about: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            VStack(alignment: .leading, spacing: 15) {
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
            
            HStack {
                Text("Excited Level")
                    .font(.title2)
                Spacer()
                RateView(rating: .constant(rate), maximumRating: 5, offImage: Image(systemName: "heart"), onImage: Image(systemName: "heart.fill"))
                    .padding(.vertical)
            }
            
            VStack(alignment: .leading) {
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
