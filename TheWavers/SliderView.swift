//
//  SliderView.swift
//  TheWavers
//
//  Created by Luca Caporicci on 19/02/24.
//

import SwiftUI

struct VerticalMaskedSliderView: View {
    @GestureState private var dragOffset: CGSize = .zero
    @State private var sliderValue: CGFloat = 0
    let maxScrollLimit: CGFloat = 550 // Limite massimo di scorrimento
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                NavigationView {
                    VStack {
                        Spacer()
                            .frame(minHeight: (geometry.size.height - 100 - self.maxScrollLimit) / 2) // Spazio per centrare verticalmente
                        
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.black)
                            .offset(y: max(-self.maxScrollLimit, min(0 + self.dragOffset.height, 0)) + (geometry.size.height - 100) / 2)
                            .padding(.bottom, 100)
                            .gesture(DragGesture()
                                .updating(self.$dragOffset) { value, state, _ in
                                    state = value.translation
                                }
                                .onEnded { value in
                                    let newOffset = self.sliderValue + value.translation.height
                                    self.sliderValue = min(max(-self.maxScrollLimit, newOffset), -50)
                            })
                        
                        Spacer()
                            .frame(minHeight: (geometry.size.height - 100 - self.maxScrollLimit) / 2) // Spazio per centrare verticalmente
                    }
                }
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct SliderView: View {
    var body: some View {
        VerticalMaskedSliderView()
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
