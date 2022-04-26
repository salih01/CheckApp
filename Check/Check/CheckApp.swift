//
//  CheckApp.swift
//  Check
//
//  Created by Salih Çakmak on 11.02.2022.
//

import SwiftUI


@main
struct CheckApp: App {
    let persistenceController = PersistenceController.shared
 
    var body: some Scene {
        WindowGroup {
            TabBar()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}




