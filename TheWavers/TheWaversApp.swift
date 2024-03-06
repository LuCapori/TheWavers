//
//  TheWaversApp.swift
//  TheWavers
//
//  Created by Luca Caporicci on 19/02/24.
//

import SwiftUI

@main
struct TheWaversApp: App {
    @StateObject var isFirstLaunchChecker = IsFirstLaunchChecker()
    
    var body: some Scene {
        WindowGroup {
            if isFirstLaunchChecker.isFirstLaunch {
                WelcomeView()
            } else {
                ContentView()
            }
        }
    }
}

class IsFirstLaunchChecker: ObservableObject {
    @Published var isFirstLaunch: Bool
    
    init() {
        self.isFirstLaunch = UserDefaults.standard.bool(forKey: "isFirstLaunch")
        if isFirstLaunch {
            UserDefaults.standard.set(false, forKey: "isFirstLaunch")
        }
    }
}
