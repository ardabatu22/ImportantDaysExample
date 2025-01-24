//
//  ImportantDaysExApp.swift
//  ImportantDaysEx
//
//  Created by Batuhan Arda on 24.01.2025.
//

import SwiftUI
import SwiftData

@main
struct ImportantDaysExApp: App {
    init(){
        let appearanceNav = UINavigationBarAppearance()
        appearanceNav.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = appearanceNav
        UINavigationBar.appearance().scrollEdgeAppearance = appearanceNav
        
        let appearanceTab = UITabBarAppearance()
        appearanceTab.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = appearanceTab
        UITabBar.appearance().standardAppearance = appearanceTab
        
    }
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: AddDaysModel.self)

    }
}
