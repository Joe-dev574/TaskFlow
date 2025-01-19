//
//  Task.swift
//  TaskFlow
//
//  Created by Joseph DeWeese on 1/18/25.
//

import Foundation
import SwiftData
import SwiftUI


@Model
class Task {
    @Attribute(.unique) var id: UUID
    var title: String
    var remark: String?
    var dateAdded: Date = Date()
    var dueDate: Date?
    var status: Status.RawValue = Status.Hold.rawValue
    var isCompleted: Bool
    var priority: Priority
    var category: String
    var tintColor: String
    @Relationship(deleteRule: .cascade)
    var notes: [Note]?
    @Relationship(inverse: \Tag.tasks)
    var tags: [Tag]?
    
    init(
        id: UUID,
        title: String,
        remark: String? = nil,
        dateAdded: Date,
        dueDate: Date? = nil,
        status: Status.RawValue,
        isCompleted: Bool,
        priority: Priority,
        category: Category,
        tintColor: TintColor,
        notes: [Note]? = nil,
        tags: [Tag]? = nil
    ) {
        self.id = id
        self.title = title
        self.remark = remark
        self.dateAdded = dateAdded
        self.dueDate = dueDate
        self.status = status
        self.isCompleted = isCompleted
        self.priority = priority
        self.category = category.rawValue
        self.tintColor = tintColor.color
        self.notes = notes
        self.tags = tags
    }
    var icon: Image {
        switch Status(rawValue: status)! {
        case .Hold:
            Image(systemName: "checkmark.diamond.fill")
        case .Active:
            Image(systemName: "item.fill")
        case .Completed:
            Image(systemName: "books.vertical.fill")
        }
    }
    /// Extracting Color Value from tintColor String
    @Transient
    var color: Color {
        return tints.first(where: { $0.color == tintColor })?.value ?? Constants.shared.tintColor
    }
    @Transient
    var tint: TintColor? {
        return tints.first(where: { $0.color == tintColor })
    }
    @Transient
    var rawCategory: Category? {
        return Category.allCases.first(where: { category == $0.rawValue })
    }
}
    enum Status: Int, Codable, Identifiable, CaseIterable {
        case Hold, Active, Completed
        var id: Self {
            self
        }
        var descr: LocalizedStringResource {
            switch self {
            case .Hold:
                "On Shelf"
            case .Active:
                "Active"
            case .Completed:
                "Completed"
            }
        }
    }

