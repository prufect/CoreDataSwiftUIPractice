//
//  CoreDataPracticeApp.swift
//  Shared
//
//  Created by Prudhvi Gadiraju on 7/28/20.
//

import SwiftUI
import CoreData

@main
struct CoreDataPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}

var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "CoreData")
    container.loadPersistentStores { (_, error) in
        if let error = error {
            fatalError("Error Loading Persistent Store: \(error), \(error.localizedDescription)" )
        }
    }
    return container
}()

func saveContext() {
    let context = persistentContainer.viewContext
    if context.hasChanges {
        do {
            try context.save()
        } catch let error {
            fatalError("Error Saving Context: \(error), \(error.localizedDescription)")
        }
    }
}
