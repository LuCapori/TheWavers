//
//  SliderView.swift
//  TheWavers
//
//  Created by Luca Caporicci on 19/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var value: CGFloat = 1
    private var maxValue: CGFloat = 10
    
    var body: some View {
        VStack(spacing: 50) {
            HStack {
                CustomSlider(value: $value, maxValue: maxValue)
                Spacer()
            }
        }
        .padding(.horizontal, 20)
    }
}

struct CustomSlider: View {
    @Binding var value: CGFloat
    private var maxValue: CGFloat
    
    init(value: Binding<CGFloat>, maxValue: CGFloat) {
        self._value = value
        self.maxValue = maxValue
    }
    
    var body: some View {
        GeometryReader { proxy in
            let offsets = calculateOffsets(proxy: proxy)
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(capsuleGradient)
                    .frame(width: 20, height: proxy.size.height)
                    .offset(offsets.capsuleOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                updateValue(proxy: proxy, gesture: gesture)
                            }
                    )
                    .zIndex(0)
                
                Circle()
                    .fill(circleColor)
                    .frame(width: 20, height: 20)
                    .offset(offsets.circleOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                updateValue(proxy: proxy, gesture: gesture)
                            }
                    )
                    .zIndex(1)
            }
            .frame(width: 20, height: UIScreen.main.bounds.height * 0.88, alignment: .leading) // Modifica delle dimensioni del frame
        }
    }
    
    private func calculateOffsets(proxy: GeometryProxy) -> (capsuleOffset: CGSize, circleOffset: CGSize) {
        let capsuleHeight = proxy.size.height
        let sliderHeight = capsuleHeight / maxValue
        let totalHeight = sliderHeight * value
        let capsuleOffset = CGSize(width: 165, height: capsuleHeight - totalHeight)
        let circleOffset = CGSize(width: 0, height: capsuleHeight - totalHeight)
        return (capsuleOffset, circleOffset)
    }
    
    private var capsuleGradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .bottom, endPoint: .top)
    }
    
    private var circleColor: Color {
        let percent = value / maxValue
        return Color.interpolate(from: .blue, to: .red, percent: percent)
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
