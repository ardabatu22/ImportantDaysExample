//
//  AddDaysModel.swift
//  ImportantDaysEx
//
//  Created by Batuhan Arda on 24.01.2025.
//

import Foundation
import SwiftData

@Model
class AddDaysModel: Identifiable {
    
    @Attribute(.unique) let id = UUID()
    let importantDayName: String
    let importantDayDate: Date
    
    init(importantDayName: String, importantDayDate: Date) {
        self.importantDayName = importantDayName
        self.importantDayDate = importantDayDate
    }
}
