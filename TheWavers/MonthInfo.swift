//
//  MonthInfo.swift
//  TheWavers
//
//  Created by Gabriele Perillo on 01/03/24.
//

import Foundation

struct MonthInfo : Identifiable{
    let id = UUID()
    let month: String
    let avg: CGFloat
    let face: Faces
    
    init(month: String, avg: CGFloat) {
        self.month = month
        self.avg = avg
        switch avg {
        case 0.0..<0.31: self.face = .happy
        case 0.31..<0.5: self.face = .neutral
        case 0.51...1.0: self.face = .sad
        default: self.face = .neutral
        }
    }
}

enum Faces {
    case happy
    case neutral
    case sad
}
