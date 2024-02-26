//
//  TabView.swift
//  TheWavers
//
//  Created by Gabriele Perillo on 22/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ProgressView()
                .tabItem { 
                    Label("Progress", systemImage: "chart.bar.fill")
                        
                }
            SliderView()
                .tabItem {
                    Label("Add", systemImage: "plus.circle.fill")
                }
                SyntomsView()
                .tabItem {
                    Label("look", systemImage: "circle")
                }
                    
                
        }
       
    }
}

#Preview {
    ContentView()
}
