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
    @StateObject var viewRouter: ViewRouter = ViewRouter()
    @StateObject var viewRouterForTransactions: ViewRouterTransactions = ViewRouterTransactions()

    var body: some Scene {
        WindowGroup {

            MainSurveyView()
           //MainView(viewRouter: viewRouter, viewRouterForTransactions: viewRouterForTransactions)
                //.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
