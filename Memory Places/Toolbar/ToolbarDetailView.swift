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
    
    private let lockLabel = "Lock"
    private let lockIcon = "lock"
    private let lockIconAlternative = ".open"
    
    private let deleteLabel = "Delete"
    private let deleteIcon = "trash"
    
    private let favoriteLabel = "Favorite"
    private let favoriteIcon = "star"
    private let favoriteIconAlternative = ".fill"
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Button { isLocked.toggle() } label: {
                Label(lockLabel, systemImage: generateIcon(
                    lockIcon, modifier: lockIconAlternative, haveModifier: !isLocked
                ))
            }
        }
        
        ToolbarItemGroup(placement: .bottomBar) {
            Button(role: .destructive) { showingDeleteAlert = true } label: {
                Label(deleteLabel, systemImage: deleteIcon)
            }
            Button { isFavorited.toggle() } label: {
                Label(favoriteLabel, systemImage: generateIcon(
                    favoriteIcon, modifier: favoriteIconAlternative, haveModifier: isFavorited
                ))
            }
        }
    }
}
