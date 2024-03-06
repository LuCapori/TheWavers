//
//  MyselfView.swift
//  TheWavers
//
//  Created by Luca Caporicci on 23/02/24.
//

import SwiftUI

struct MyselfView: View {
    
    var body: some View {
        
        ScrollView{
            
            Text("Hi, Sara!")
                .bold()
                .padding(.bottom, 40)
            
            ZStack{
                RoundedRectangle(cornerRadius: 40)
                    .frame(width: 350, height: 350)
                    .foregroundColor(.rect)
                
                Text("Treatment")
                    .bold()
                    .font(.system(size: 45))
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .center){
                HStack{
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 160, height: 176)
                            .padding(.trailing, 10)
                            .foregroundColor(.rect)
                        Text("Excercises ")
                            .bold()
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 160, height: 176)
                            .foregroundColor(.rect)
                        Text("Tips")
                            .bold()
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                    }
                    
                }
                .padding(.top, 10)
                
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 160, height: 176)
                            .padding(.trailing, 10)
                            .foregroundColor(.rect)
                        Text("Distraction ")
                            .bold()
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 160, height: 176)
                            .foregroundColor(.rect)
                        Text("Info")
                            .bold()
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                        
                    }
                }
                .padding(.top, 10)
            }
        }
    }
}

#Preview {
    MyselfView()
}
