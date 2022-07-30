/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Ho Le Minh Thach
 ID: s3877980
 Created  date: 17/07/2022
 Last modified: 17/07/2022
 Acknowledgement:
 Learning from Hacking with Swift to implement Authentication, PhotoPicker, and the usage of CoreData
 Hudson, P. (n.d.). The 100 days of Swiftui. Hacking with Swift. Retrieved July 30, 2022, from https://www.hackingwithswift.com/100/swiftui
*/
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
