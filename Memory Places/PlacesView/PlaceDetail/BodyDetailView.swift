//
//  BodyDetailView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 17/07/2022.
//

import SwiftUI

struct BodyDetailView: View {
    let title: String
    let about: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("About \(title)")
                .font(.title2)
                .foregroundColor(.secondary)
            
            Text(about)

        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct BodyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BodyDetailView(title: "Testing", about: "Testing")
    }
}
