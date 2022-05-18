//
//  BreweryApp.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 06/04/22.
//

import SwiftUI

@main
struct BreweryApp: App {
    let persistenceContainer = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
