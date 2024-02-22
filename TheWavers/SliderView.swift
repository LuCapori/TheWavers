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
    @State private var scrolled: Bool = false
    private var sliderHeight: CGFloat = UIScreen.main.bounds.height * 0.6
    private let feedbackGenerator = UISelectionFeedbackGenerator() // Cambiato il feedback aptico

    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Text("Scroll up \n to match your pain")
                    .font(.title2)
                    .fontWeight(.thin)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .opacity(value == 0 ? 1 : 0)
                
                Button(action: {}) {
                    Image(systemName: "arrow.right.circle")
                        .foregroundColor(.gray)
                }
                .disabled(!scrolled)
                .opacity((scrolled && value != 0) ? 1 : 0)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .center)
                .offset(y: sliderHeight * (1 - value))
            }
            Spacer()

            CustomSlider(value: $value, scrolled: $scrolled, maxValue: maxValue, feedbackGenerator: feedbackGenerator) // Passa il feedbackGenerator a CustomSlider
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.85)
        .background(Color.black)
    }
}

struct CustomSlider: View {
    @Binding var value: CGFloat
    @Binding var scrolled: Bool

    private var maxValue: CGFloat
    private var size = UIScreen.main.bounds.height * 0.1
    private let feedbackGenerator: UISelectionFeedbackGenerator // Cambiato il feedbackGenerator
    
    init(value: Binding<CGFloat>, scrolled: Binding<Bool>, maxValue: CGFloat, feedbackGenerator: UISelectionFeedbackGenerator) { // Cambiato il feedbackGenerator
        self._value = value
        self._scrolled = scrolled
        self.maxValue = maxValue
        self.feedbackGenerator = feedbackGenerator // Inizializza il feedbackGenerator
    }
    
    var body: some View {
        GeometryReader { proxy in
            let offsets = calculateOffsets(proxy: proxy)
            ZStack {
                Capsule()
                    .fill(capsuleGradient)
                    .frame(width: size, height: size + (value * proxy.size.height))
                    .offset(x: offsets.capsuleOffset.width, y: offsets.capsuleOffset.height - 30)
                    .zIndex(0)
            }
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        updateValue(proxy: proxy, gesture: gesture)
                        scrolled = false
                        _ = gesture.location.y / proxy.size.height // Calcola l'intensità basata sulla posizione dello scroll
                        feedbackGenerator.selectionChanged() // Invia il feedback aptico
                        feedbackGenerator.selectionChanged() // Aggiungi più impulsi per aumentare l'intensità
                    }
                    .onEnded { _ in
                        scrolled = true
                    }
            )
        }
        .frame(width: size, height: UIScreen.main.bounds.height * 0.6)
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
        LinearGradient(gradient: Gradient(colors: [.color1, circleColor]), startPoint: .bottom, endPoint: .top)
    }
    
    private var circleColor: Color {
        let percent = value / maxValue
        return Color.interpolate(from: .color1, to: .color, percent: percent)
    }
    
    private func updateValue(proxy: GeometryProxy, gesture: DragGesture.Value) {
        let newValue = min(max(gesture.location.y, 0), proxy.size.height)
        value = maxValue - (newValue / proxy.size.height * maxValue)
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
            return start
        }
        
        let interpolatedRed = startComponents[0] + (endComponents[0] - startComponents[0]) * CGFloat(Float(percentage))
        let interpolatedGreen = startComponents[1] + (endComponents[1] - startComponents[1]) * CGFloat(Float(percentage))
        let interpolatedBlue = startComponents[2] + (endComponents[2] - startComponents[2]) * CGFloat(Float(percentage))
        
        return Color(red: Double(interpolatedRed), green: Double(interpolatedGreen), blue: Double(interpolatedBlue))
    }
}
