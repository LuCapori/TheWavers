//
//  LoginFirstView.swift
//  TheWavers
//
//  Created by Massimo Paloscia on 05/03/24.
//

import SwiftUI
import SwiftData


struct LoginFirstView: View {
    @State private var name: String = ""
    @State private var isTextEntered: Bool = false
    

    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack{
                    Text("What’s your name?")
                        .font(.system(.title3))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .keyboardType(.default)
                        .foregroundColor(.white)
                    
                    TextField("", text: $name)
                        .font(.system(size: 40))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .keyboardType(.default)
                        .foregroundColor(.testo)
                    
                    
                    if(isTextEntered){
                        Button(action: {
                        
                        }) {
                            NavigationLink(destination: VulvodyniaDiagnosisView().onAppear(perform:{
                                UserDefaults.standard.set(name, forKey: "name")
                                UserDefaults.standard.synchronize()
                            })) {
                                Text("CONTINUE")
                                    .fontWeight(.light)
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 50).fill(.testo).frame(width: proxy.size.width * 0.6))
                            }
                            //.padding(.leading, proxy.size.width * 0.3)
                            .padding(.top, proxy.size.width * 0.2)
                    }
                        
                    }
                }.onChange(of: name) { newValue in
                    isTextEntered = !newValue.isEmpty
                }
                .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }.navigationBarBackButtonHidden(true)
        
    }
    

}

#Preview {
    LoginFirstView()
}
