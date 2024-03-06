//
//  PainPosition.swift
//  TheWavers
//
//  Created by Luca Caporicci on 04/03/24.
//

import Foundation

struct PainPosition : Identifiable {
    var id = UUID()
    var title: String
}
let painData: [PainPosition] = [
    
    PainPosition(title: "Vulva"),
    PainPosition(title: "Clitoris"),
    PainPosition(title: "Ovaries"),
    PainPosition(title: "Uterus"),
    PainPosition(title: "Legs"),
    PainPosition(title: "Rectum"),
    PainPosition(title: "Vagina"),
    PainPosition(title: "Abdomen"),
    PainPosition(title: "Urethra")

    
]
