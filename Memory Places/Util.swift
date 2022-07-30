/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Ho Le Minh Thach
 ID: s3877980
 Created  date: 16/07/2022
 Last modified: 16/07/2022
 Acknowledgement:
 Learning from Hacking with Swift to implement Authentication, PhotoPicker, and the usage of CoreData
 Hudson, P. (n.d.). The 100 days of Swiftui. Hacking with Swift. Retrieved July 30, 2022, from https://www.hackingwithswift.com/100/swiftui
*/

import Foundation
import CoreData

/// This function will generate the icon base on the status of the modifier (useful if an icon have 2 state of selected and non selected
/// - Parameters:
///   - icon: the icon string name that present the non selected state
///   - modifier: the modifier part of the icon string name that present the selected state
///   - haveModifier: the boolean for either non selected state (false) or selected state (true)
/// - Returns: the icon string present the state
func generateIcon(_ icon: String, modifier: String, haveModifier: Bool) -> String {
    if (haveModifier) { return icon + modifier }
    return icon
}

/// This funciton will ensure to save the data to core data. It will handle the exception if there is any error
/// - Parameter context: the MOC from the data controller
func saveMOC(_ context: NSManagedObjectContext) {
    do {
        try context.save()
    } catch {
        context.rollback()
    }
}

extension Bundle {
    
    /// This function is decode a json file into corresponding data object
    /// - Parameter file: a string name of the file in the bundle of the app
    /// - Returns: the corresponding data object that has decoded
    func decode <T: Codable>(_ file: String) -> T {
        // find the file in the app bundle
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        // load the data out of the file
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        // ensure that the decode will format the date by yyyy-MM-dd
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        // try to decode the data to corresponding data type
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        return loaded
    }
}

extension String {
    
    /// This function will trim the whitespace and newline on leading and trailling of a string
    /// - Parameter characterSet: the character set that will be trim - by default is the whitespace and newline
    /// - Returns: a string that has trimmed
    func trim(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        trimmingCharacters(in: characterSet)
    }
}
