//
//  ProgressView.swift
//  TheWavers
//
//  Created by Gabriele Perillo on 22/02/24.
//

import SwiftUI
import EventKitUI

struct ProgressView: View {
    @State private var selectedIndex = 0
    @State private var size = UIScreen.main.bounds.height * 0.1
    
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8", "Item 9", "Item 10"]
    
    var body: some View {
        GeometryReader {reader in
            
            let width = reader.size.width
            let height = reader.size.height
            
            VStack {
                Text("Hi, Sara")
                    .font(.title2)
                    .bold()
                    .padding(.all, 1)
                Text("Today, 26 February")
                    .font(.title3)
                Rectangle()
                    .fill(.white)
                    .frame(height: 1)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(items, id: \.self) { item in
                            Capsule()
                                .frame(width: 25, height: 60)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 10)
                                .background(capsuleColor(value: 0.5))
                                .cornerRadius(size * 0.5)
                                .overlay {
                                    Text("T")
                                        .foregroundColor(.black)
                                        .frame(width: 25, height: 60)
                                        .background(capsuleColor(value: 0.5))
                                }
                        }
                    }
                    .padding()
                }
                
                Text("Your overall monthly\nprogress")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ZStack(alignment: .bottomTrailing) {
                    Circle()
                        .fill(capsuleColor(value: 0.5))
                        .frame(width: width * 0.45, height: width * 0.5)
                        .offset(x: width * 0.08, y: width * 0.3)
                    Circle()
                        .fill(.color)
                        .frame(width: width * 0.7, height: width * 0.7)
                }
                Spacer(minLength: height * 0.145)
            }
        }
    }
}

func capsuleColor(value: Double) -> Color {
    let percent = value
    return Color.interpolate(from: .color1, to: .color, percent: percent)
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}

#Preview {
    ContentView()
}


