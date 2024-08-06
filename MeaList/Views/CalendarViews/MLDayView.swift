//
//  MLDayView.swift
//  MeaList
//
//  Created by Denis Kozlov on 11.07.2024.
//

import SwiftUI

struct MLDayView: View {
    let day: MLDay
    @Binding var isAddMealTapped: Bool
    @Binding var selectedDayId: String?
    @State var selectedDishId: UUID?
    var body: some View {
        VStack {
            ForEach(MLMealType.allCases) { mealType in
                if Set(day.meals.map(\.type)).contains(mealType) {
                    GroupBox(label: Text(mealType.rawValue)) {
                        ForEach(day.meals) { meal in
                            MLMealCellView(meal: meal,
                                           mealType: mealType,
                                           selectedDishId: $selectedDishId)
                        }
                    }.groupBoxStyle(.meal)
                }
            }
            AddMealButton(day: day,
                          tapped: $isAddMealTapped,
                          selectedDayId: $selectedDayId)
        }
    }
}
// MARK: - AddMealButton
struct AddMealButton: View {
    let day: MLDay
    @Binding var tapped: Bool
    @Binding var selectedDayId : String?
    var body: some View {
        Button {
            tapped = true
            selectedDayId = day.id
        } label: {
            HStack{
                Label("Add meal...", systemImage: "plus")
                Spacer()
            }
        }
        .padding()
        .foregroundStyle(.secondary)
    }
}
//#Preview {
//    MLDayView(day: MLDay(date: .now), days: <#Binding<Set<MLDay>>#>, isAddMealTapped: <#Binding<Bool>#>, selectedDayId: <#Binding<String?>#>)
//}
