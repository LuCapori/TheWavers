//
//  ConfigurationItem.swift
//  TheWavers
//
//  Created by Massimo Paloscia on 05/03/24.
//

import Foundation
import SwiftData

@Model
class ConfigurationItem: Identifiable{
    
    var id: String
    var name: String
    var vulovodyniaDiagnosisDate: Date
    var treatement: Bool
    var lastGynecologicalVisitDate: Date
   
    
    init(name: String, vulovodyniaDiagnosisDate: Date, treatement: Bool, lastGynecologicalVisitDate:  Date){
        
        self.id = UUID().uuidString
        self.name = name
        self.vulovodyniaDiagnosisDate = vulovodyniaDiagnosisDate
        self.treatement = treatement
        self.lastGynecologicalVisitDate = lastGynecologicalVisitDate
    }
    
}
