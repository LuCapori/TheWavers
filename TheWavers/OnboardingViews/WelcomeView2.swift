//
//  WelcomeView2.swift
//  TheWavers
//
//  Created by Gabriele Perillo on 05/03/24.
//

import SwiftUI

struct WelcomeView2: View {
    var body: some View {
        NavigationView {
            GeometryReader {proxy in
                VStack {
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: ContentView()) {
                            Text("Skip")
                                .fontWeight(.light)
                                .foregroundColor(Color.gray)
                        }.frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing)
                        
                    }
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("Vulvodynia")
                            .font(.largeTitle)
                            .foregroundColor(.testo)
                            .bold()
                        Text("Is a condition characterized by chronic vulvar pain. Treatments focus on managing improving life quality through medication, physical therapy and lifestyle.")
                            .fontWeight(.regular)
                        
                        Spacer()
                        
                        Text("16%")
                            .font(.largeTitle)
                            .foregroundColor(.testo)
                            .bold()
                        Text("Of women worldwide suffer from this condition.")
                            .fontWeight(.regular)
                        
                        Spacer()
                        
                        Text("Motivationless")
                            .font(.largeTitle)
                            .foregroundColor(.testo)
                            .bold()
                        Text("Is a common feeling due to a lack of awareness about progress during treatment.")
                            .fontWeight(.regular)
                        
                        Spacer()
                        
                    }.frame(width: proxy.size.width * 0.9, height: UIScreen.main.bounds.height * 0.8, alignment: .center)
                    
                    NavigationLink(destination: WelcomeView3()) {
                        Text("CONTINUE")
                            .fontWeight(.light)
                            .foregroundColor(.black)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 50).fill(.testo).frame(width: proxy.size.width * 0.6))
                    }
                    //.padding(.leading, proxy.size.width * 0.3)
                    .padding(.top, -70)

                    
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    WelcomeView2()
}
