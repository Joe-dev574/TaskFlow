//
//  TaskFlowApp.swift
//  TaskFlow
//
//  Created by Joseph DeWeese on 1/18/25.
//

import SwiftUI
import SwiftData

@main
struct TaskFlowApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ObjectiveList.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
