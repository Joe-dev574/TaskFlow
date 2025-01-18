//
//  Item.swift
//  TaskFlow
//
//  Created by Joseph DeWeese on 1/18/25.
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
