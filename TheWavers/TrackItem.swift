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
    var emotion: [String]
    
    init(scrollValue: CGFloat, typeOfPain: [String], localizationPain: [String], painCauses: [String], dailyEmotionText: [String], emotion: [String]) {
        self.id = UUID().uuidString
        self.scrollValue = scrollValue
        self.typeOfPain = typeOfPain
        self.localizationPain = localizationPain
        self.painCauses = painCauses
        self.dailyEmotionText = dailyEmotionText
        self.emotion = emotion
    }
    
}
let trackItemObject = TrackItem(scrollValue: 0, typeOfPain: ["test"], localizationPain: ["test1"], painCauses: ["test2"], dailyEmotionText: ["test2"], emotion: ["test3"])
