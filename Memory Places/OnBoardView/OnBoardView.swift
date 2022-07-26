//
//  OnBoardView.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 26/07/2022.
//

import SwiftUI

struct OnBoardView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Text("Welcome to Memory Place")
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .padding(.top, 60)
            .padding(.bottom)
        
        VStack(alignment: .leading, spacing: 20) {
            OnBoardItem(icon: "note.text", title: "Quick Creation", description: "Simply type or use the quick toolbar to create places.", color: .orange)
            
            OnBoardItem(icon: "square.grid.2x2", title: "Easy Organizing", description: "Create places to save all the memories and cateogrize them with favorite tags. Search quickly to reminding you of the places you have visited.", color: .mint)
            
            OnBoardItem(icon: "hand.raised.square", title: "Priotize Privacy", description: "Places can be lock so that you will be the only one to access the information.", color: .blue)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack {
                    Spacer()
                    Text("Continue")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding(.vertical, 10)
            }
            .buttonStyle(.borderedProminent)
            .padding(.bottom, 10)
        }
        .padding()
    }
}

struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardView()
    }
}
