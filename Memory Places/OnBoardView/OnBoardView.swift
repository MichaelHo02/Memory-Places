//
//  OnBoardView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 26/07/2022.
//

import SwiftUI

struct OnBoardView: View {
    @Environment(\.dismiss) var dismiss

    private let title = "Welcom to Memory Place"
    private let icon1 = "note.text"
    private let icon2 = "square.grid.2x2"
    private let icon3 = "hand.raised.square"
    
    private let sectionTitle1 = "Quick Creation"
    private let sectionTitle2 = "Easy Organizing"
    private let sectionTitle3 = "priotize Privacy"
    
    private let sectionDescription1 = "Simply type or use the quick toolbar to create places."
    private let sectionDescription2 = "Cateogrize places with favorite tags. Search quickly to remind you of places you have visited."
    private let sectionDescription3 = "Places can be lock so that you will be the only one to access the information."
    
    private let btnLabel = "Continue"
    
    var body: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .padding(.top, 60)
            .padding(.bottom)
        
        VStack(alignment: .leading, spacing: 20) {
            OnBoardItem(icon: icon1, title: sectionTitle1, description: sectionDescription1, color: .orange)
            
            OnBoardItem(icon: icon2, title: sectionTitle2, description: sectionDescription2, color: .red)
            
            OnBoardItem(icon: icon3, title: sectionTitle3, description: sectionDescription3, color: .blue)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack {
                    Spacer()
                    Text(btnLabel)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding(.vertical, 10)
            }
            .buttonStyle(.borderedProminent)
            .padding(.bottom, 10)
        }
        .padding(30)
        .interactiveDismissDisabled()
    }
}

struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardView()
    }
}
