//
//  SintomiFile.swift
//  TheWavers
//
//  Created by Luca Caporicci on 28/02/24.
//

import Foundation


struct SintomiFile : Identifiable {
    var id = UUID()
    var title: String
    
    
}
let sintomiData: [SintomiFile] = [
    
    SintomiFile(title: "Severe"),
    SintomiFile(title: "Cramp"),
    SintomiFile(title: "Pulse"),
    SintomiFile(title: "Bloating"),
    SintomiFile(title: "Pressure"),
    SintomiFile(title: "Itching"),
    SintomiFile(title: "Burning"),
    SintomiFile(title: "Profund"),
    SintomiFile(title: "Shaking")

    
]
