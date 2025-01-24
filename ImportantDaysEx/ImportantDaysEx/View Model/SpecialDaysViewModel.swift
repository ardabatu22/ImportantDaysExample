//
//  SpecialDaysViewModel.swift
//  ImportantDaysEx
//
//  Created by Batuhan Arda on 24.01.2025.
//

import Foundation
import SwiftUI

class SpecialDaysViewModel: ObservableObject {
    @Published var specialDays: [ModelRTF] = []
    @AppStorage("selectedCountry") var selectedCountry: String = "turkey" {
        didSet {
            translate()
            loadSpecialDays()
        }
    }
    @Published var countryname = ""
    @Published var countryimages = ""
    @Published var tabviewtext = ""
    @Published var tabviewtext2 = ""
    @Published var header = ""
    @Published var country = ""
    @Published var sectionheader = ""
    @Published var prompt = ""
    @Published var buttonName = ""
    @Published var mySpecialDaysInput = ""
    @Published var mySpecialDaysDateInput = ""

    
    init() {
        translate()
        loadSpecialDays()
    }
    
    func translate() {
        switch selectedCountry {
        case "turkey":
            countryname = "Türkiye"
            countryimages = "turkey"
            tabviewtext = "Önemli Günler"
            tabviewtext2 = "Benim Önemli Günlerim"
            header = "Önemli Günler"
            country = "Ülke Seçimi"
            sectionheader = "Günler"
            prompt = "Ara"
            buttonName = "Gün Ekle"
            mySpecialDaysInput = "Önemli Gün Ekle"
            mySpecialDaysDateInput = "Tarih"
            break
        case "usa":
            countryname = "USA"
            countryimages = "usa"
            tabviewtext = "Important Days"
            tabviewtext2 = "My Special Days"
            header = "Important Days"
            country = "Select Country"
            sectionheader = "Days"
            prompt = "Search"
            buttonName = "Add Days"
            mySpecialDaysInput = "Add Important Day"
            mySpecialDaysDateInput = "Date"
            break
        case "deutschland":
            countryname = "Deutschland"
            countryimages = "deutschland"
            tabviewtext = "Wichtige Tage"
            tabviewtext2 = "Meine besonderen Tage"
            header = "Wichtige Tage"
            country = "Land auswählen"
            sectionheader = "Tage"
            prompt = "Suche"
            buttonName = "Tag hinzufügen"
            mySpecialDaysInput = "wichtigen Tag hinzufügen"
            mySpecialDaysDateInput = "Datum"
            break
        default:
            break
        }
    }
    
    func loadSpecialDays() {
        specialDays.removeAll()
        guard let fileURL = Bundle.main.url(forResource: selectedCountry, withExtension: "rtf") else {
            print("RTF dosyası bulunamadı.")
            return
        }
        
        do {
            let attributedString = try NSAttributedString(url: fileURL, options: [.documentType: NSAttributedString.DocumentType.rtf], documentAttributes: nil)
            let string = attributedString.string
            let lines = string.components(separatedBy: .newlines).filter { !$0.isEmpty }
            
            specialDays = lines.compactMap { line in
                let components = line.components(separatedBy: "-")
                guard components.count >= 2 else {
                    print("Satır formatı hatalı: \(line)")
                    return nil
                }
                let date = components[0].trimmingCharacters(in: .whitespacesAndNewlines)
                let name = components[1].trimmingCharacters(in: .whitespacesAndNewlines)
                return ModelRTF(date: date, name: name)
            }
        } catch {
            print("Özel günler yüklenirken hata: \(error)")
        }
    }

}
