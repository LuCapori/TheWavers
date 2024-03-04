//
//  MonthList.swift
//  TheWavers
//
//  Created by Gabriele Perillo on 01/03/24.
//

import SwiftUI

struct MonthList: View {
    @State var scrollOffset: CGPoint = .zero
    @State var months : [MonthInfo] = []
    @State var isTappedArray: [Bool] = []
    
    var body: some View {
    
            GeometryReader{ reader in
                let width = reader.size.width
                let height = reader.size.height
                ScrollView {
                    VStack(spacing: 0){
                        ForEach(0..<months.count, id: \.self) { index in
                            MonthCard(isFirst: index == 0, 
                                      scrollAmt: scrollOffset.y / height,
                                      summary: months[index], tapCallBack: { isTappedArray[index].toggle() })
                                .frame(width: width,
                                       height: getHeight(height, index, isTappedArray[index]))
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .coordinateSpace(name: "scroll")
                .frame(width: width, height: height)
                .background(GeometryReader { geometry in
                    Color.clear
                        .preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll")).origin)
                })
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    self.scrollOffset = value
                    print(self.scrollOffset)
                }
            }
            .onAppear{
                //TODO: here load data from core data
                months = [MonthInfo(month: "January", avg: 0.3), MonthInfo(month: "December", avg: 0.75), MonthInfo(month: "January", avg: 0.3), MonthInfo(month: "December", avg: 0.75)]
                isTappedArray = Array(repeating: false, count: months.count)
            }
        }
    
    func getHeight(_ height: CGFloat, _ index: Int, _ isTapped: Bool)->CGFloat {
        var newHeight = height
        if index == 0 {
            if isTapped {
                newHeight = height
            } else {
                newHeight = height * 0.7 * (1 - scrollOffset.y / height)
            }
        } else {
            if isTapped {
                newHeight = height
            } else {
                newHeight = height * 0.35
            }
        }
        return newHeight
    }
}

#Preview {
    GeometryReader { reader in
        Spacer()
        MonthList()
            .frame(width: reader.size.width, height: reader.size.height * 0.5)

        
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}
