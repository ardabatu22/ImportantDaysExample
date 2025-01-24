//
//  Model.swift
//  ImportantDaysEx
//
//  Created by Batuhan Arda on 24.01.2025.
//

import Foundation

class ModelRTF:Identifiable{
    let id = UUID()
    let date: String
    let name: String
    
    init(date: String, name: String) {
        self.date = date
        self.name = name
    }
    
}
