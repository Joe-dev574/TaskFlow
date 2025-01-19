//
//  Priority.swift
//  TaskFlow
//
//  Created by Joseph DeWeese on 1/18/25.
//

import Foundation
import SwiftUI

// Define Priority as an enum since it's a fixed set of options
enum Priority: String, Codable, CaseIterable {
    case low = "Low"
    case normal = "Normal"
    case high = "High"
}
