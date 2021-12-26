//
//  ILikeToWatchApp.swift
//  Shared
//
//  Created by Steph Ananth on 12/24/21.
//

import SwiftUI

@main
struct ILikeToWatchApp: App {
    let persistenceController: PersistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MainView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
