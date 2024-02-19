//
//  ContentView.swift
//  TheWavers
//
//  Created by Luca Caporicci on 19/02/24.
//

import SwiftUI

struct VerticalMaskedSliderView: View {
    @State private var sliderValue: Double = 0
    let maxValue: Double
    
    init(maxValue: Double) {
        self.maxValue = maxValue
    }
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack(alignment: .bottom) {
                    
                    Slider(value: self.$sliderValue, in: 0...self.maxValue)
                        .rotationEffect(.degrees(-90))
                    
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        VerticalMaskedSliderView(maxValue: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
