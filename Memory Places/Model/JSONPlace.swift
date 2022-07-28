//
//  JSONPlace.swift
//  Memory Places
//
//  Created by Ho Le Minh Thach on 28/07/2022.
//

import Foundation

struct JSONPlace: Codable {
    let title: String
    let startDate: Date
    let endDate: Date
    let about: String
    let address: String
    let rate: Int
    let isFavorited: Bool
    let isLocked: Bool
    let people: [String]
    let longitude: Double
    let latitude: Double
}
