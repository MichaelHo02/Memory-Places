//
//  GetImageSection.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 17/07/2022.
//

import SwiftUI

struct GetImageSection: View {
    @Binding var image: Image?
    @Binding var showingImagePicker: Bool
    
    private let promptSelectImg = "Select Image"
    private let selectImgIcon = "photo"
    
    private let headerImage = "Caption"
    
    var body: some View {
        Section {
            image?
                .resizable()
                .scaledToFit()
                .padding(.vertical, 10)
            Button { showingImagePicker = true } label: {
                Label(promptSelectImg, systemImage: selectImgIcon)
            }
            .padding(.vertical, 10)
        } header: {
            Text(headerImage)
        }
    }
}
