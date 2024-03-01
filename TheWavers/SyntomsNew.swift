//
//  SyntomsNew.swift
//  TheWavers
//
//  Created by Luca Caporicci on 27/02/24.
//

import SwiftUI

struct SyntomsNew: View {
    
    
    let symptoms = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
    @State var sintomi : [SintomiFile] = sintomiData
    
    @State var selectedSymptoms: [SintomiFile] = []
    
    var body: some View {
        //  GeometryReader  {reader in
        
        ZStack{
            Image("background1")
                .resizable()
            
            ScrollView{
                VStack(alignment: .leading){
                    
                    Text("What are your main \(Text("symptoms?").foregroundColor(Color.testo))")
                        .fontWeight(.heavy)
                        .foregroundColor(.white) // Colore normale
                        .font(.system(size: 35))
                        .offset(CGSize(width: 10.0, height: 10.0))
                    
                    Spacer(minLength: 45)
                    
                    Text("Type of pain")
                        .offset(CGSize(width: 10.0, height: 10.0))
                        .font(.title3)
                        .bold()
                        .padding(.bottom, 20)
                    
                    
                    LazyVGrid(columns: symptoms, content: {
                        ForEach(sintomi) { sintomiFile in
                            Button(action: {
                                if selectedSymptoms.contains(where: { $0.id == sintomiFile.id }) {
                                    selectedSymptoms.removeAll(where: { $0.id == sintomiFile.id })
                                } else {
                                    selectedSymptoms.append(sintomiFile)
                                }
                                
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 100)
                                        .foregroundColor(selectedSymptoms.contains(where: { $0.id == sintomiFile.id }) ? .selectedItem : Color.clear)
                                        .frame( width: 110, height: 39)
                                    // Contenuto del pulsante
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 100)
                                                .stroke(selectedSymptoms.contains(where: { $0.id == sintomiFile.id }) ? .black : .white, lineWidth: 0.4)
                                            
                                        )
                                    
                                    Text(sintomiFile.title)
                                        .foregroundColor(selectedSymptoms.contains(where: { $0.id == sintomiFile.id }) ? .white : .white)
                                        .padding()
                                        .background(Color.clear)
                                        .cornerRadius(10)
                                    
                                }
                            }
                        }
                    }
                    )}
            }
            
            
        }
    }
}

#Preview {
    SyntomsNew()
}
