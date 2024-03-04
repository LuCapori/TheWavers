//
//  Face.swift
//  TheWavers
//
//  Created by Gabriele Perillo on 01/03/24.
//

import SwiftUI

struct Face: View {
    var face: Faces
    
    var body: some View {
        GeometryReader { reader in
            let width = reader.size.width
            let height = reader.size.height
            
            Path { path  in
                path.addEllipse(in: CGRect(x:  width * 0.275, y:  height * 0.3, width:  width * 0.1, height:  width * 0.1))
                
                path.addEllipse(in: CGRect(x:  width * 0.625, y:  height * 0.3, width:  width * 0.1, height:  width * 0.1))
                
            }
            
            Path { path in
                path.addEllipse(in: CGRect(x: 0, y: 0, width:  width, height:  width))
                
                let firstPMouthX =  width * 0.25
                let secondPMouthX =  width * 0.75
                let middlePMouthX = (firstPMouthX + secondPMouthX) / 2
                let middlePMouthY: CGFloat
                switch face {
                case .happy:
                    middlePMouthY =  width * 0.85
                case .neutral:
                    middlePMouthY =  width * 0.7
                case .sad:
                    middlePMouthY =  width * 0.45
                }
                
                path.move(to: CGPoint(x: firstPMouthX, y:  width * 0.7))
                path.addQuadCurve(to: CGPoint(x: secondPMouthX, y:  width * 0.7), control: CGPoint(x: middlePMouthX, y: middlePMouthY))
            }
            .stroke()
            
        }
    }
}

#Preview {
    VStack{
        Face(face: .happy)
            .frame(width: 100, height: 100)
        
        Face(face: .neutral)
            .frame(width: 100, height: 100)
        
        
        Face(face: .sad)
            .frame(width: 100, height: 100)
    }
}
