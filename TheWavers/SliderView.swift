//
//  SliderView.swift
//  TheWavers
//
//  Created by Luca Caporicci on 19/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var value: CGFloat = 0
    private var maxValue: CGFloat = 1
    @State private var fatto: Bool = false
    
    var body: some View {
        VStack() {
            Spacer()
            ZStack{
                Text("FORZA NAPOLI")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.blue)
                    .opacity(value == 0 ? 1 : 0)
                
                Button("", systemImage: "chevron.forward.circle", action: {
                    
                })
                .disabled(!fatto)
                .opacity(value == 0 ? 0 : 1)
                .font(.title)
                .bold()
 
            }
            Spacer()

            HStack {
                Spacer()
                CustomSlider(value: $value, fatto: $fatto, maxValue: maxValue)
                Spacer()
            }
            Spacer()
            
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.85)
        .background(.black)
    }
}

struct CustomSlider: View {
    @Binding var value: CGFloat
    @Binding var fatto: Bool

    private var maxValue: CGFloat
    private var size = UIScreen.main.bounds.height * 0.1
    
    init(value: Binding<CGFloat>, fatto: Binding<Bool>, maxValue: CGFloat) {
        self._value = value
        self._fatto = fatto

        self.maxValue = maxValue
    }
    
    var body: some View {
        GeometryReader { proxy in
            let offsets = calculateOffsets(proxy: proxy)
                ZStack() {
                    Capsule()
                        .fill(capsuleGradient)
                        .frame(width: size, height: size + (value * proxy.size.height))
                        .offset(x: offsets.capsuleOffset.width, y: offsets.capsuleOffset.height-30)
                        .zIndex(0)
                    
//                    Circle()
//                        .fill(circleColor)
//                        .frame(width: 40, height: 40)
//                        .offset(offsets.circleOffset)
//                        .zIndex(1)
                }
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            updateValue(proxy: proxy, gesture: gesture)
                        }
                        .onEnded{_ in 
                            if value == 0{
                                fatto = false
                            }
                            else {
                                fatto = true
                            }
                        }
                )
              
            
        }.frame(width: size, height: UIScreen.main.bounds.height * 0.6) // Modifica delle dimensioni del frame
        
    }
    
    private func calculateOffsets(proxy: GeometryProxy) -> (capsuleOffset: CGSize, circleOffset: CGSize) {
        let capsuleHeight = proxy.size.height
        let sliderHeight = capsuleHeight / maxValue
        let totalHeight = sliderHeight * value
        let capsuleOffset = CGSize(width: 0, height: capsuleHeight - totalHeight)
        let circleOffset = CGSize(width: 0, height: capsuleHeight - 1.5 * totalHeight)
        return (capsuleOffset, circleOffset)
    }
    
    private var capsuleGradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [.blue, circleColor]), startPoint: .bottom, endPoint: .top)
    }
    
    private var circleColor: Color {
        let percent = value / maxValue
        return Color.interpolate(from: .blue, to: .pink, percent: percent)
    }
    
    private func updateValue(proxy: GeometryProxy, gesture: DragGesture.Value) {
        let newValue = min(max(gesture.location.y, 0), proxy.size.height)
        value = maxValue - (newValue / proxy.size.height * maxValue) // Inverti il valore per rispettare l'orientamento verticale e assegna il nuovo valore dello slider
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

extension Color {
    static func interpolate(from start: Color, to end: Color, percent: CGFloat) -> Color {
        let percentage = max(0, min(1, percent))
        guard let startComponents = UIColor(start).cgColor.components, let endComponents = UIColor(end).cgColor.components else {
            return start // Ritorna il colore iniziale se non è possibile ottenere i componenti del colore
        }
        
        let interpolatedRed = startComponents[0] + (endComponents[0] - startComponents[0]) * CGFloat(Float(percentage))
        let interpolatedGreen = startComponents[1] + (endComponents[1] - startComponents[1]) * CGFloat(Float(percentage))
        let interpolatedBlue = startComponents[2] + (endComponents[2] - startComponents[2]) * CGFloat(Float(percentage))
        
        return Color(red: Double(interpolatedRed), green: Double(interpolatedGreen), blue: Double(interpolatedBlue))
    }
}
