//
//  MLDayView.swift
//  MeaList
//
//  Created by Denis Kozlov on 11.07.2024.
//

import SwiftUI

struct MLDayView: View {
    @Environment(\.calendarEnvironmentValue) private var calendar
    let day: MLDay
    var body: some View {
        VStack {
            ForEach(MLMealType.allCases) { mealType in
                if Set(day.meals.map(\.type)).contains(mealType) {
                    GroupBox(label: Text(mealType.rawValue)) {
                        ForEach(day.meals) { meal in
                            MLMealCellView(meal: meal,
                                           mealType: mealType)
                        }
                    }.groupBoxStyle(.meal)
                }
            }
            AddMealButton(day: day)
        }
    }
}
// MARK: - AddMealButton
struct AddMealButton: View {
    @Environment(\.calendarEnvironmentValue) private var calendar
    let day: MLDay
    var body: some View {
        Button {
            calendar.selectedDay = day
            calendar.state = .adding
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

#Preview {
    MLDayView(day: MLDay(date: .now))
        .environment(\.calendarEnvironmentValue, MLCalendar())
}
