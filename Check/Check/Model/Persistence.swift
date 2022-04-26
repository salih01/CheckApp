//
//  Persistence.swift
//  Check
//
//  Created by Salih Çakmak on 11.02.2022.
//

import CoreData

struct PersistenceController {
    
    // MARK: 1. PERSISTENT CONTROLLER
    static let shared = PersistenceController()

    //MARK 2. PERSISTENT CONTAINTER
    let container: NSPersistentContainer

    //MARK 3. INITIALIZATION
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Check")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
             
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    
    //MARK: 4. Preview
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for i in 0..<5 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = "Sample task No\(i)"
            newItem.completion = false
            newItem.id = UUID()
        }
        do {
            try viewContext.save()
        } catch {
           
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

}
