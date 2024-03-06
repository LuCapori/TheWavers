//
//  TheWaversApp.swift
//  TheWavers
//
//  Created by Luca Caporicci on 19/02/24.
//

import SwiftUI
import SwiftData

@main
struct TheWaversApp: App {
    @AppStorage ("currentView") var currentView = 1
    var body: some Scene {
        WindowGroup {
            if currentView == 1 {
                WelcomeView()
                    .preferredColorScheme(.dark)
            } else if currentView == 2 {
                ContentView()
                    .preferredColorScheme(.dark)
            }
        }
    }
}
