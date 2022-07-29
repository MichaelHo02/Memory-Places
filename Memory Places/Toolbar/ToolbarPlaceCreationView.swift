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
    
    private let addLabel = "Add"
    private let cancelLabel = "Cancel"
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .confirmationAction) {
            Button(addLabel, action: saveItem)
                .disabled(allowSubmit())
        }
        
        ToolbarItem(placement: .cancellationAction) {
            Button(cancelLabel, role: .cancel) {
                dismiss()
            }
        }
    }
}
