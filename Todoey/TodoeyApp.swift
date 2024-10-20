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
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
