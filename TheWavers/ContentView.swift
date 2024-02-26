//
//  TabView.swift
//  TheWavers
//
//  Created by Gabriele Perillo on 22/02/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            TabView {
                ProgressView()
                    .tabItem {
                        Label("Progress", systemImage: "chart.bar.fill")
                    }
                
                SliderView()
                    .tabItem {
                        Label("Add", systemImage: "plus.circle.fill")
                    }
                
         //       MyselfView()
              TextInser()
                    .tabItem {
                        Label("Myself", systemImage: "circle.fill")
                    }
                
            }.preferredColorScheme(.dark)
                .tint(LinearGradient(gradient: .init(colors: [.color, .color1]), startPoint: .bottom, endPoint: .top))
        } .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
