//
//  ToolbarContentView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 16/07/2022.
//

import SwiftUI

struct ToolbarContentView: ToolbarContent {
    
    private let addMockDataMsg = "Add Mock Data"
    private let addMockDataLogo = "externaldrive.badge.plus"
    private let clearAllMsg = "Clear All"
    private let clearAllLogo = "trash"
    private let pickerMsg = "Display Selection"
    private let pickerOption = ["All", "Favorite"]
    private let newPlaceMsg = "New Place"
    private let newPlaceIcon = "square.and.pencil"
    private let moreMsg = "More"
    private let moreIcon = "ellipsis.circle"
    
    let addMockData: () -> Void
    
    @Binding var showingCreationSheet: Bool
    @Binding var showingDeleteAllAlert: Bool
    var count: Int
    
    var body: some ToolbarContent {
        
        ToolbarItem(placement: .primaryAction) {
            EditButton()
        }
        ToolbarItemGroup(placement: .bottomBar) {
            Menu {
                Button(action: addMockData) {
                    Label(addMockDataMsg, systemImage: addMockDataLogo)
                }
                Button(role: .destructive) { showingDeleteAllAlert.toggle() } label: {
                    Label(clearAllMsg, systemImage: clearAllLogo)
                }
            } label: {
                Label(moreMsg, systemImage: moreIcon)
            }
            Spacer()
            Text("Places: \(count)")
            Spacer()
            Button { showingCreationSheet.toggle() } label: {
                Label(newPlaceMsg, systemImage: newPlaceIcon)
            }
        }
    }
}
