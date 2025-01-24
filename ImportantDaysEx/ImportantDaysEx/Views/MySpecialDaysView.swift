//
//  MySpecialDaysView.swift
//  ImportantDaysEx
//
//  Created by Batuhan Arda on 24.01.2025.
//

import SwiftUI
import SwiftData

struct MySpecialDaysView: View {
    @ObservedObject var viewModel: SpecialDaysViewModel
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \AddDaysModel.importantDayDate) private var results: [AddDaysModel]
    
    @State private var specialDayName = ""
    @State private var selectedDate = Date()
    @State private var animationAmount: CGFloat = 1.0
    @State private var searchText = ""
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                VStack(spacing: 15) {
                    HStack {
                        Image(systemName: "pencil.circle")
                            .foregroundColor(.purple)
                        TextField(viewModel.mySpecialDaysInput, text: $specialDayName)
                            .padding(.leading, 10)
                        
                            .frame(height: 44)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    }.padding(.top , 20)
                    
                    HStack {
                        Image(systemName: "calendar.badge.plus")
                            .foregroundColor(.purple)
                        DatePicker(viewModel.mySpecialDaysDateInput, selection: $selectedDate, displayedComponents: .date)
                            .padding(.leading, 10)
                            .frame(height: 44)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                
                Button(action: {
                    if addSpecialDay() {
                        withAnimation(.easeOut(duration: 0.3)) {
                            animationAmount += 0.2
                        }
                        withAnimation(.easeOut(duration: 0.3).delay(0.1)) {
                            animationAmount -= 0.2
                        }
                    }
                }) {
                    Text(viewModel.buttonName)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .scaleEffect(animationAmount)
                }
                Divider()
                //Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .shadow(radius: 2)

                    TextField(viewModel.prompt, text: $searchText)
                        .padding(7)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 10)
                }.padding(.horizontal)
                
                List {
                    Section(header: Text(viewModel.header)
                        .foregroundColor(.purple)
                        .font(.headline)) {
                            ForEach(filteredMySpecialDays) { result in
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(result.importantDayName)
                                        .font(.headline)
                                    Text(dateToString(result.importantDayDate))
                                        .font(.subheadline)
                                        .foregroundStyle(.red)
                                }
                                .padding(.vertical, 5)
                            }.onDelete(perform: deleteSpecialDayss)
                        }
                }
                Spacer()
                
            }
            .navigationTitle(viewModel.tabviewtext2)
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
    func dateToString(_ date: Date) -> String {
           let formatter = DateFormatter()
           formatter.dateFormat = "dd/MM/yyyy"
           return formatter.string(from: date)
       }
    
    func addSpecialDay() -> Bool {
        guard specialDayName.count > 0 else {
            return false
        }
        let result = AddDaysModel(importantDayName: specialDayName, importantDayDate: selectedDate)
        modelContext.insert(result)
        return true
    }
    func deleteSpecialDayss(at offsets: IndexSet) {
        for offset in offsets {
            let specialDay = results[offset]
            modelContext.delete(specialDay)
        }
    }
    var filteredMySpecialDays: [AddDaysModel] {
        if searchText.isEmpty {
            return results
        } else {
            return results.filter { $0.importantDayName.localizedCaseInsensitiveContains(searchText) ||  $0.importantDayDate.formatted(date: .numeric, time: .omitted).localizedCaseInsensitiveContains(searchText) }
        }
    }
}

#Preview {
    MySpecialDaysView(viewModel: SpecialDaysViewModel())
}
