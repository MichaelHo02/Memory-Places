//
//  TimelineSectionView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 30/07/2022.
//

import SwiftUI

struct TimelineSectionView: View {
    let startDate: Date?
    let endDate: Date?
    
    private let addressIcon = "mappin"
    private let titleTimeline = "Timeline"
    private let notAvailableText = "N/A"
    private let iconArrow = "arrow.right"
    
    var body: some View {
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
    }
}
