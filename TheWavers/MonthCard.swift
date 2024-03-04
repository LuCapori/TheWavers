//
//  MonthCard.swift
//  TheWavers
//
//  Created by Gabriele Perillo on 01/03/24.
//

import SwiftUI

struct MonthCard: View {
    @State var isFirst: Bool
    @State var scrollAmt: CGFloat
    @State var summary: MonthInfo
    var tapCallBack: () -> Void
    
    var body: some View {
        GeometryReader{ reader in
            let width = reader.size.width
            let height = reader.size.height
            
            VStack{
                let faceSize = width * 0.2
                HStack{
                    Text(summary.month)
                        .font(.largeTitle)
                    if !isFirst {
                        Spacer()
                        Face(face: summary.face)
                            .frame(width: faceSize * 0.5, height: faceSize * 0.5)
                            .padding(.trailing, faceSize * 0.5)
                            
                    } else {
                        Spacer()
                        Face(face: summary.face)
                            .frame(width: faceSize * 0.5, height: faceSize * 0.5)
                            .padding(.trailing, faceSize * 0.5)
                        .opacity(scrollAmt)
                    }
                }
                .frame(width: width, alignment: .leading)
                .padding(.leading, width * 0.1)
                
                if isFirst {
                    HStack {
                        Text("Your pain’s avarage is about \(String(format: "%.0f", summary.avg * 100))%")
                            .font(.title2)
                    }
                    .frame(width: width, alignment: .leading)
                    .padding(.leading, width * 0.1)
                    
                    HStack{
                        Face(face: summary.face)
                            .frame(width: faceSize, height: faceSize)

                    }
                    .frame(width: width, alignment: .leading)
                    .padding(.leading, width * 0.1)
                    .padding(.top)
                    .opacity(1 - scrollAmt)
                }
            }
            .frame(width: width, height: height)
            .background(.pink)
            .onTapGesture {
                withAnimation {
                    tapCallBack()
                }
            }
        }
    }
    
}

#Preview {
    GeometryReader { reader in
        
        VStack(spacing: 0){
            MonthCard(isFirst: true, scrollAmt: 0, summary: MonthInfo(month: "January", avg: 0.7), tapCallBack: {})
                .frame(maxWidth: reader.size.width, maxHeight: .infinity)
                
            MonthCard(isFirst: false, scrollAmt: 0, summary: MonthInfo(month: "December", avg: 0.7), tapCallBack: {})
                .frame(maxWidth: reader.size.width, maxHeight: .infinity)
        }
            
    }
    .frame(maxHeight: .infinity, alignment: .bottom)
}
