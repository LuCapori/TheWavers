//
//  treatmentView.swift
//  TheWavers
//
//  Created by Massimo Paloscia on 06/03/24.
//

import SwiftUI

struct TreatmentView: View {
    
    @State private var treatment: Bool = false
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack{
                    Text("Are you under treatment?")
                        .font(.system(.title3))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .keyboardType(.default)
                        .foregroundColor(.white)
                        .padding(.bottom)
                    
                    HStack(spacing: -150){
                        Button(action: {
                            
                        }) {
                            NavigationLink(destination: GynecologicalVisitView().onAppear(perform:{
                                self.treatment = true
                                UserDefaults.standard.setValue(treatment, forKey: "treatment")
                            })){
                                Text("Yes")
                                    .font(.system(size: 40))
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity)
                                    .keyboardType(.default)
                                    .foregroundColor(.testo)
                            }
                        }
                        
                        Button(action: {
                            
                        }) {
                            NavigationLink(destination: GynecologicalVisitView().onAppear(perform:{
                                self.treatment = false
                                UserDefaults.standard.setValue(treatment, forKey: "treatment")
                            })){
                                Text("No")
                                    .font(.system(size: 40))
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity)
                                    .keyboardType(.default)
                                    .foregroundColor(.testo)
                            }
                        }
                        
                        
                    }
                }.frame(width: proxy.size.width, height: proxy.size.height)
            }
        }.navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    TreatmentView()
}
