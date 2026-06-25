//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Evgeniy Polyak on 16.06.2026.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
