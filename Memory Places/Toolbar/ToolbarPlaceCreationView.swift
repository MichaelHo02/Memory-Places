//
//  ToolbarPlaceCreationView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 17/07/2022.
//

import SwiftUI

struct ToolbarPlaceCreationView: ToolbarContent {
    @Environment(\.dismiss) var dismiss

    let saveItem: () -> Void
    let allowSubmit: () -> Bool
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .confirmationAction) {
            Button("Add", action: saveItem)
                .disabled(allowSubmit())
        }
        
        ToolbarItem(placement: .cancellationAction) {
            Button("Cancel", role: .cancel) {
                dismiss()
            }
        }
    }
}
