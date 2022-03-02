//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Daniel Jesus Callisaya Hidalgo on 1/3/22.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
