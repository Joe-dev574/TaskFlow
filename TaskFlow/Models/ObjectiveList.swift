//
//  ObjectiveList.swift
//  TaskFlow
//
//  Created by Joseph DeWeese on 1/18/25.
//

import Foundation
import SwiftData
import SwiftUI



@Model
final class ObjectiveList {
    @Attribute(.unique) var id: UUID
    var name: String = ""
    var briefDescription: String?
    var colorCode: String = "#34C759"
    
    @Relationship(deleteRule: .cascade)
    var tasks: [Task]?
    
    init(name: String, colorCode: String) {
        self.id = UUID()
        self.name = name
        self.colorCode = colorCode
    }
}
