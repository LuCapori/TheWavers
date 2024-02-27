//
//  SyntomsNew.swift
//  TheWavers
//
//  Created by Luca Caporicci on 27/02/24.
//

import SwiftUI

struct SyntomsNew: View {
    var body: some View {
        //  GeometryReader  {reader in
        HStack{
            VStack(alignment: .leading){
                
                
                Text("What are your main \(Text("symptoms?").foregroundColor(Color.testo1))")
                    .fontWeight(.heavy)
                    .foregroundColor(.white) // Colore normale
                    .font(.system(size: 35))
                    
                
                //                     .offset(x: -30, y:-300)
                
                Text("Type of pain")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                //                    .offset(x: -110, y:-260)
            }
            
        }
        
    }
}

#Preview {
    SyntomsNew()
}
