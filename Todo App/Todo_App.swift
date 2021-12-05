//
//  Todo_AppApp.swift
//  Todo App
//
//  Created by Eli Hartnett on 12/4/21.
//

import SwiftUI

@main
struct Todo_App: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
