//
//  SpecialDaysView.swift
//  ImportantDaysEx
//
//  Created by Batuhan Arda on 24.01.2025.
//

import SwiftUI

struct ArrowButton: View {
    let direction: Direction
    let action: () -> Void
    
    enum Direction {
        case left, right
    }
    
    var body: some View {
        Button(action: {
            withAnimation {
                action()
            }
        }) {
            Image(systemName: direction == .left ? "chevron.left" : "chevron.right")
                .padding()
                .background(Circle().fill(Color.gray.opacity(0.3)))
                .foregroundColor(.purple)
                .bold()
        }
    }
}


struct SpecialDaysView: View {
    @StateObject var viewModel = SpecialDaysViewModel()
    @State private var searchText = ""
    @State private var currentCountryIndex = 0
    private let countries = ["turkey", "usa", "deutschland"]
    var filteredSpecialDays: [ModelRTF] {
        if searchText.isEmpty {
            return viewModel.specialDays
        } else {
            return viewModel.specialDays.filter { $0.name.localizedCaseInsensitiveContains(searchText) || $0.date.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Country Name
                Text(viewModel.country)
                    .font(.largeTitle)
                    .foregroundStyle(.link)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                    .shadow(radius: 2)
                
                // Country Image and buttons
                HStack {
                    ArrowButton(direction: .left) {
                        currentCountryIndex = (currentCountryIndex - 1 + countries.count) % countries.count
                        viewModel.selectedCountry = countries[currentCountryIndex]
                    }
                    .padding(.leading, 25)
                    
                    Spacer()
                    
                    Image(viewModel.countryimages)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 10)
                        .padding()
                    
                    Spacer()
                    
                    ArrowButton(direction: .right) {
                        currentCountryIndex = (currentCountryIndex + 1) % countries.count
                        viewModel.selectedCountry = countries[currentCountryIndex]
                    }
                    .padding(.trailing, 25)
                }
                
                // Country name
                Text(viewModel.countryname)
                    .font(.title)
                    .foregroundStyle(.teal)
                    .fontWeight(.semibold)
                    .padding(.vertical, 10)
                    .shadow(radius: 1)
                Divider()
                
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .shadow(radius: 2)
                    TextField(viewModel.prompt, text: $searchText)
                        .padding(7)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 10)
                }
                .padding()
                
                // Special Days List
                ScrollView {
                    LazyVStack(spacing: 15) {
                        ForEach(filteredSpecialDays) { day in
                            VStack(spacing:0){
                                Text(day.date)
                                    .frame(maxWidth:.infinity,alignment:.leading)
                                    .padding(.horizontal)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.red)
                               
                                Text(day.name)
                                    .frame(maxWidth:.infinity,alignment:.leading)
                                    .padding(.horizontal)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .padding(.top, 4)
                               
                            }
                            .padding(5)
                            .background(.white)
                            .clipShape(.rect(cornerRadius: 10))
                        }
                    }
                    .padding(.horizontal,30)
                    .padding(.top,30)
                    .background(.regularMaterial) 
                }
            
            }.navigationTitle(viewModel.header)
            .background(Color(.systemBackground))
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
  
}

#Preview {
    SpecialDaysView(viewModel: SpecialDaysViewModel())
}
