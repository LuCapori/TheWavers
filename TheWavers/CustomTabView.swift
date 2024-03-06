//
//  CustomTabView.swift
//  TheWavers
//
//  Created by Gabriele Perillo on 28/02/24.
//

import SwiftUI

struct TabViewItem {
    
    
    let id = UUID()
    let viewName: String
    let iconName: String
    var hasToNavigate: Bool = false
    
    @ViewBuilder var view: some View {
        switch self.viewName {
        case "Journal": ProgressView()
        case "Add": SliderView()
        case "Myself": MyselfView()
        default: EmptyView()
        }
    }
}

struct CustomTabView: View {
    
    @State var views: [ TabViewItem ]
    @Binding var selection: Int
    
    var body: some View {
        GeometryReader{ reader in
            HStack {
                ForEach(0..<views.count, id: \.self) { index in
                    NavigationLink(destination: views[index].view ) {
                        VStack {
                            Image(systemName: views[index].iconName)
                            Text(views[index].viewName)
                        }
                        .foregroundStyle(selection == index ? Color("AccentColor") : .gray)
                    }
                    .tag(index)
                    .disabled(!views[index].hasToNavigate)
                    .onTapGesture {
                        selection = index
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .frame(width: reader.size.width, height: reader.size.height)
        }
        
    }
}



