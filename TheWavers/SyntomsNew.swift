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
    
    let pains = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
    @State var pain : [PainPosition] = painData
    @State var selectedPains: [PainPosition] = []
    
    let causes = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
    @State var cause : [CausesTrig] = causesData
    @State var selectedCauses: [CausesTrig] = []
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                Image("background1")
                    .resizable()
                
                ScrollView{
                    VStack(alignment: .leading){
//                        VStack {
//                            Spacer()
//                            HStack {
//                                Spacer()
//                                NavigationLink(destination: TextInser()) {
//                                    Text("GO ON")
//                                        .foregroundColor(.white)
//                                        .font(.title3)
//                                        .fontWeight(.heavy)
//                                        .background(Color.clear)
//                                        .cornerRadius(8)
//                                }
//                                .padding(.horizontal, 20)
//                            }
//                        }

                        
                        Text("What are your main \(Text("symptoms?").foregroundColor(Color.testo))")
                            .fontWeight(.heavy)
                            .foregroundColor(.white) // Colore normale
                            .font(.system(size: 35))
                            .offset(CGSize(width: 10.0, height: 10.0))
                        
                        Spacer(minLength: 45)
                        
                        Text("Type of pain")  //prima lista
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
                        )
                        .padding(.bottom, 30)
                        
                        Text("Where do you feel it more?")   //seconda lista
                        
                            .offset(CGSize(width: 10.0, height: 10.0))
                            .font(.title3)
                            .bold()
                            .padding(.bottom, 20)
                        
                        LazyVGrid(columns: pains, content: {
                            ForEach(pain) { painPosition in
                                Button(action: {
                                    if selectedPains.contains(where: { $0.id == painPosition.id }) {
                                        selectedPains.removeAll(where: { $0.id == painPosition.id })
                                    } else {
                                        selectedPains.append(painPosition)
                                    }
                                    
                                }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 100)
                                            .foregroundColor(selectedPains.contains(where: { $0.id == painPosition.id }) ? .selectedItem : Color.clear)
                                            .frame( width: 110, height: 39)
                                        // Contenuto del pulsante
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 100)
                                                    .stroke(selectedPains.contains(where: { $0.id == painPosition.id }) ? .black : .white, lineWidth: 0.4)
                                                
                                            )
                                        
                                        Text(painPosition.title)
                                            .foregroundColor(selectedPains.contains(where: { $0.id == painPosition.id }) ? .white : .white)
                                            .padding()
                                            .background(Color.clear)
                                            .cornerRadius(10)
                                        
                                    }
                                }
                            }
                        }
                        )
                        .padding(.bottom, 30)
                        
                        Text("Causes and triggers")  //terza lista
                            .offset(CGSize(width: 10.0, height: 10.0))
                            .font(.title3)
                            .bold()
                            .padding(.bottom, 20)
                        
                        LazyVGrid(columns: causes, content: {
                            ForEach(cause) { causesTrig in
                                Button(action: {
                                    if selectedCauses.contains(where: { $0.id == causesTrig.id }) {
                                        selectedCauses.removeAll(where: { $0.id == causesTrig.id })
                                    } else {
                                        selectedCauses.append(causesTrig)
                                    }
                                    
                                }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 100)
                                            .foregroundColor(selectedCauses.contains(where: { $0.id == causesTrig.id }) ? .selectedItem : Color.clear)
                                            .frame( width: 110, height: 39)
                                        // Contenuto del pulsante
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 100)
                                                    .stroke(selectedCauses.contains(where: { $0.id == causesTrig.id }) ? .black : .white, lineWidth: 0.4)
                                                
                                            )
                                        
                                        Text(causesTrig.title)
                                            .foregroundColor(selectedCauses.contains(where: { $0.id == causesTrig.id }) ? .white : .white)
                                            .padding()
                                            .background(Color.clear)
                                            .cornerRadius(10)
                                        
                                    }
                                }
                            }
                        }
                        )
                    }
                }
                
                NavigationLink(destination: TextInser()) {
                    Text("GO ON")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.heavy)
                        .background(Color.clear)
                        .cornerRadius(8)
                        
                }.offset(x: 150, y: -350)
            }
        }
    }
}


#Preview {
    SyntomsNew()
}
