//
//  LocationSectionView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 30/07/2022.
//

import SwiftUI

struct LocationSectionView: View {
    let address: String
    
    private let titleLocation = "Location"

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(titleLocation)
                .font(.title2)
            
            Text(address)
        }
    }
}
