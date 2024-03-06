//
//  MotiField.swift
//  TheWavers
//
//  Created by Luca Caporicci on 05/03/24.
//

import SwiftUI

struct MotiField2: View {
    var body: some View {
        
        ZStack{
            Image("Rect1")
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .leading){
                
                Text("Never let fear \nhold you \nback.")
                    .fontWeight(.thin)
                    .font(.system(size: 50))
                    .padding()
                
                Text("You are \n\(Text("STRONGER").fontWeight(.bold)) \nthan you \(Text("THINK!").fontWeight(.bold))")
                    .fontWeight(.thin)
                    .font(.system(size: 50))
                    .padding()
                //  Text("What are your main \(Text("symptoms?").foregroundColor(Color.testo))") Esempio da seguire
                Spacer()
                
                //                    NavigationLink(destination: ProgressView()) {
                //                        Text("Journal")
                //                            .fontWeight(.medium)
                //                            .font(.system(size: 24))
                //                            .foregroundColor(.white)
                //                            .padding()
                //                            .frame(minWidth: 59, maxWidth: 275)
                //                            .background(Color.clear)
                //                            .cornerRadius(100)
                //                        //                        .frame(minWidth: 0, maxWidth: .infinity)
                //                            .overlay(
                //                                RoundedRectangle(cornerRadius: 100)
                //                                    .stroke(Color.white, lineWidth: 2)
                //                            )
                //
                //                    }
                
            }
            .padding(.bottom, 70)
            .padding(.top, 70)
            
            NavigationLink(destination: ProgressView()) {
                Text("Journal")
                    .fontWeight(.medium)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .padding()
                    .frame(minWidth: 59, maxWidth: 275)
                    .background(Color.clear)
                    .cornerRadius(100)
                //                        .frame(minWidth: 0, maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(Color.white, lineWidth: 2)
                    )
                
            }
            .offset(y: 270)
            
            
        }
    }
}


#Preview {
    MotiField2()
}
