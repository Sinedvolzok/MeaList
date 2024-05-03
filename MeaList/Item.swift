//
//  Item.swift
//  MeaList
//
//  Created by Denis Kozlov on 03.05.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
