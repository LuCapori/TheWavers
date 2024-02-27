//
//  TextInser.swift
//  TheWavers
//
//  Created by Luca Caporicci on 26/02/24.
//

import SwiftUI

struct TextInser: View {
    
    @State private var value: CGFloat = 0
    @State private var description: String = ""
    
    var body: some View {
                VStack{
                    TextField("Describe how you are feeling right now...", text: $description)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .opacity(value == 0 ? 1 : 0)
                    
                        .toolbar {
                            ToolbarItem(placement: .keyboard) {
                                Button(action: {
                                    // Qui puoi gestire l'azione del pulsante (es. passaggio alla schermata successiva)
                                    // Per ora, puoi solo nascondere la tastiera
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                }) {
                                    Image(systemName: "arrow.right.circle.fill")
                                }
                            }
                        }
        }
        
        
    }
}

#Preview {
    TextInser()
}
