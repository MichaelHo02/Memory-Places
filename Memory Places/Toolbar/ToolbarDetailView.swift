//
//  ToolbarDetailView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 17/07/2022.
//

import SwiftUI

struct ToolbarDetailView: ToolbarContent {
    @Binding var isLocked: Bool
    @Binding var showingDeleteAlert: Bool
    @Binding var isFavorited: Bool
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Button { isLocked.toggle() } label: {
                Label("Lock", systemImage: generateIcon(
                    "lock", modifier: ".open", haveModifier: !isLocked
                ))
            }
        }
        
        ToolbarItemGroup(placement: .bottomBar) {
            Button(role: .destructive) { showingDeleteAlert = true } label: {
                Label("Delete", systemImage: "trash")
            }
            Button { isFavorited.toggle() } label: {
                Label("Favorite", systemImage: generateIcon(
                    "star", modifier: ".fill", haveModifier: isFavorited
                ))
            }
        }
    }
}
