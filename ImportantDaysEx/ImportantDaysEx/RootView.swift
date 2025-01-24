//
//  ContentView.swift
//  ImportantDaysEx
//
//  Created by Batuhan Arda on 24.01.2025.
//

import SwiftUI

struct RootView: View {
    @StateObject private var viewModel = SpecialDaysViewModel()
    
    var body: some View {
        TabView {
            SpecialDaysView(viewModel: viewModel)
                .tabItem {
                    Label(viewModel.tabviewtext, systemImage: "calendar")
                    
                }
            

            MySpecialDaysView(viewModel:viewModel)
                .tabItem {
                    Label(viewModel.tabviewtext2, systemImage: "star")
                }
            
        }
        .onAppear {
            viewModel.translate()
        }
        .onChange(of: viewModel.selectedCountry) {
            viewModel.translate()
        }
        
        .tint(.purple)
    }
}

#Preview {
    RootView()
}
