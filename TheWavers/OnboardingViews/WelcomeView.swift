//
//  WelcomeView.swift
//  TheWavers
//
//  Created by Gabriele Perillo on 05/03/24.
//

import SwiftUI

struct WelcomeView: View {
    @State private var value: CGFloat = 1
    private var size = UIScreen.main.bounds.height * 0.1
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack(alignment: .leading) {
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
                    let offsets = calculateOffsets(proxy: proxy)
                    
                    Spacer()
                    
                    Text("Welcome to")
                        .font(.largeTitle)
                        .foregroundColor(.testo)
                    Text("Vease!")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.testo)
                        
                    ZStack(alignment: .topLeading) {
            
                        Text("Let’s take a few minutes to discover what VEase is about.\nMake sure you’re in a quiet space and ready for a few simple steps.")
                            .fontWeight(.regular)
                        
                        Spacer()
                        
                        HStack {
                            
                            Capsule()
                                .fill(capsuleGradient)
                                .frame(width: size, height: calculateTotalHeight(proxy: proxy)) // Utilizzo della funzione per calcolare l'altezza totale
                                .offset(x: 0, y: calculateTotalHeight(proxy: proxy) * 0.1)
                                .zIndex(0)
                        }
                        .frame(width: proxy.size.width * 0.9, height: UIScreen.main.bounds.height * 0.7, alignment: .center)
                    }
                    Spacer() // Spazio aggiunto per posizionare il rettangolo più vicino alla Capsule
                    
                    NavigationLink(destination: WelcomeView2()) {
                        Text("CONTINUE")
                            .fontWeight(.light)
                            .foregroundColor(.black)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 50).fill(.testo).frame(width: proxy.size.width * 0.6))
                    }
                    .padding(.leading, proxy.size.width * 0.3)
                    .padding(.top, -proxy.size.width * 0.2)
                }.padding(.leading)
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    private func calculateOffsets(proxy: GeometryProxy) -> (capsuleOffset: CGSize, circleOffset: CGSize) {
        let capsuleHeight = proxy.size.height
        let sliderHeight = capsuleHeight / value
        let totalHeight = sliderHeight * value * 0.5
        let capsuleOffset = CGSize(width: 0, height: capsuleHeight - totalHeight)
        let circleOffset = CGSize(width: 0, height: capsuleHeight - 1.5 * totalHeight)
        return (capsuleOffset, circleOffset)
    }
    
    private func calculateTotalHeight(proxy: GeometryProxy) -> CGFloat {
        let capsuleHeight = proxy.size.height
        let sliderHeight = capsuleHeight / value
        return sliderHeight * value * 0.4
    }
    
    private var capsuleGradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [.color1, circleColor]), startPoint: .bottom, endPoint: .top)
    }
    
    private var circleColor: Color {
        let percent = value
        return Color.interpolate(from: .color1, to: .color, percent: percent)
    }
}

#Preview {
    WelcomeView()
}
