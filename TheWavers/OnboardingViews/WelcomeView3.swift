//
//  WelcomeView3.swift
//  TheWavers
//
//  Created by Gabriele Perillo on 05/03/24.
//

import SwiftUI

struct WelcomeView3: View {
    @State private var value: CGFloat = 1
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
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
                        Text("The VAS Scale")
                            .font(.largeTitle)
                            .foregroundColor(.testo)
                            .bold()
                        Text("Is a scientific rating scale used to measure the intensity of patients pain")
                            .fontWeight(.regular)
                        
                        
                        Capsule()
                            .fill(capsuleGradient)
                            .frame(width: proxy.size.width * 0.9, height: 10)
                            .padding(.vertical, 30)
                        
                        
                        Spacer()
                        
                        
                        Text("Keep track and be aware of progress")
                            .font(.largeTitle)
                            .foregroundColor(.testo)
                            .bold()
                        Text("Explore the benefits of keeping track of your emotions throughout your vulvodynia healing journey.")
                            .fontWeight(.regular)
                        
                        Spacer()
                        
                        
                    }.frame(width: proxy.size.width * 0.9, height: UIScreen.main.bounds.height * 0.8, alignment: .center)
                    
                    NavigationLink(destination: WelcomeView4()) {
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
    
    private var capsuleGradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [.color1, circleColor]), startPoint: .leading, endPoint: .trailing)
    }
    
    private var circleColor: Color {
        let percent = value
        return Color.interpolate(from: .color1, to: .color, percent: percent)
    }
}


#Preview {
    WelcomeView3()
}
