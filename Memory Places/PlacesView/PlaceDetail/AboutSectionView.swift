//
//  AboutSectionView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 30/07/2022.
//

import SwiftUI

struct AboutSectionView: View {
    let title: String
    let about: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("About \(title)")
                .font(.title2)
            Divider()
            Text(about)
        }
    }
}
