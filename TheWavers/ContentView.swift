//
//  TabView.swift
//  TheWavers
//
//  Created by Gabriele Perillo on 22/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var tabSelectionInt: Int = 0
    @State var isSliderPresented = false
    
    let views : [TabViewItem] = [
        TabViewItem(viewName: "Journal", iconName: "chart.bar.fill"),
        TabViewItem(viewName: "Add", iconName: "plus.circle.fill", hasToNavigate: true),
        TabViewItem(viewName: "Myself", iconName: "person.fill"),
    ]
    
    
    var body: some View {
        
        NavigationView {
            GeometryReader{ reader in
                let width = reader.size.width
                let height = reader.size.height
                
                VStack {
                    ZStack{
                        views[tabSelectionInt].view
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    CustomTabView(views: views, selection: $tabSelectionInt)
                        .frame(width: width, height: height * 0.1)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}

