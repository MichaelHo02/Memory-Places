//
//  Util.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 16/07/2022.
//

import Foundation
import CoreData

func generateIcon(_ icon: String, modifier: String, haveModifier: Bool) -> String {
    if (haveModifier) { return icon + modifier }
    return icon
}

func saveMOC(_ context: NSManagedObjectContext) {
    do {
        try context.save()
    } catch {
        context.rollback()
    }
}

extension Bundle {
    func decode <T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        return loaded
    }
}
