//
//  News_AppApp.swift
//  News App
//
//  Created by Youssef Al-Hassan on 01/10/2024.
//

import SwiftUI

@main
struct News_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Home()
        }
    }
}
