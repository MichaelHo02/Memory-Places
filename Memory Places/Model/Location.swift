//
//  Location.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 16/07/2022.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    let latitude: Double
    let longitude: Double
}
