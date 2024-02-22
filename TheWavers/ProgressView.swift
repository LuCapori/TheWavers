//
//  ProgressView.swift
//  TheWavers
//
//  Created by Gabriele Perillo on 22/02/24.
//

import SwiftUI

struct ProgressView: View {
    @State private var selectedIndex = 0
    
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8", "Item 9", "Item 10"]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(items, id: \.self) { item in
                        Capsule()
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .overlay(
                                Text(item)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 15)
                            )
                            .padding(.vertical, 10)
                            .padding(.horizontal, 10)
                            .background(Color.white)
                            .cornerRadius(20)
                    }
                }
                .padding()
            }
            
            Spacer()
            
            // Tab bar
            HStack {
                Button(action: {
                    self.selectedIndex = 0
                }) {
                    VStack {
                        Image(systemName: "circle.fill")
                            .imageScale(.small)
                        Text("Myself")
                            .font(.subheadline)
                            .fontWeight(.thin)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    self.selectedIndex = 1
                }) {
                    VStack {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                        Text("Check-in")
                            .font(.subheadline)
                            .fontWeight(.thin)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    self.selectedIndex = 2
                }) {
                    VStack {
                        Image(systemName: "chart.bar.fill")
                            .imageScale(.small)
                        Text("Progress")
                            .font(.subheadline)
                            .fontWeight(.thin)
                    }
                }
            }
            .padding()
            .foregroundColor(.white)
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}

