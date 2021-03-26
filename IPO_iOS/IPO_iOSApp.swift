//
//  IPO_iOSApp.swift
//  IPO_iOS
//
//  Created by Ivanov Ivan on 03.03.2021.
//
//

import SwiftUI

@main
struct IPO_iOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
