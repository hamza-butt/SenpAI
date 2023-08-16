//
//  SenpaiApp.swift
//  Senpai
//
//  Created by Hamza Butt on 8/9/23.
//

import SwiftUI

@main
struct SenpaiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
