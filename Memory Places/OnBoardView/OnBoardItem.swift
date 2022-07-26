//
//  OnBoardItem.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 26/07/2022.
//

import SwiftUI

struct OnBoardItem: View {
    
    let icon: String
    let title: String
    let description: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .foregroundColor(color)
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.semibold)
                Text(description)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}
