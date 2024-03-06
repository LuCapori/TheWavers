//
//  TrackItem.swift
//  TheWavers
//
//  Created by Massimo Paloscia on 05/03/24.
//

import Foundation
import SwiftData

@Model
class TrackItem: Identifiable{
    
    var id: String
    var scrollValue: CGFloat
    var typeOfPain: [String]
    var localizationPain: [String]
    var painCauses: [String]
    var dailyEmotionText: [String]
    
    init(scrollValue: CGFloat, typeOfPain: [String], localizationPain: [String], painCauses: [String], dailyEmotionText: [String]) {
        self.id = UUID().uuidString
        self.scrollValue = scrollValue
        self.typeOfPain = typeOfPain
        self.localizationPain = localizationPain
        self.painCauses = painCauses
        self.dailyEmotionText = dailyEmotionText
    }
    
}
