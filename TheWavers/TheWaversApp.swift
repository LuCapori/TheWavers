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
    
    var body: some Scene {
        WindowGroup {
//            TextInser()
//                .preferredColorScheme(.dark)
            LoginFirstView()
        }
        .modelContainer(for: TrackItem.self)
    }
}
