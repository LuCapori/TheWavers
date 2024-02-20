//
//  SyntomsView.swift
//  TheWavers
//
//  Created by Luca Caporicci on 20/02/24.
//

import Foundation
import SwiftUI

struct ViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // Aggiorna l'UI se necessario
    }
}

struct SyntomsView: View {
    var body: some View {
        ViewControllerWrapper()
    }
}

//@main
struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            SyntomsView()
        }
    }
}
struct SyntomsView_Previews: PreviewProvider {
    static var previews: some View {
        SyntomsView()
    }
}
