//
//  TodoeyApp.swift
//  Todoey
//
//  Created by Saurabh Dhingra on 20/10/24.
//

import SwiftUI

@main
struct TodoeyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Task.self)
    }
}
