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
    
    var body: some View {
        Section {
            image?
                .resizable()
                .scaledToFit()
            
            Button { showingImagePicker = true } label: {
                Label(promptSelectImg, systemImage: selectImgIcon)
            }
        }
        .padding(.vertical)
    }
}
