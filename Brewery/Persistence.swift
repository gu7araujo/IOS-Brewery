//
//  Persistence.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 18/05/22.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "Brewery")

        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolve Error: \(error)")
            }
        }
    }
}
