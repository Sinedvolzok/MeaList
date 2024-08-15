//
//  MLMealCellView.swift
//  MeaList
//
//  Created by Denis Kozlov on 06.08.2024.
//

import SwiftUI

struct MLMealCellView: View {
    @Environment(\.calendarEnvironmentValue) private var calendar
    let meal: MLMeal
    let mealType: MLMealType
    var body: some View {
        HStack(spacing: 16) {
            if meal.type == mealType {
                HStack {
                    Text(meal.dish.title)
                    Spacer()
                }
                .padding(2)
                .background(Color(UIColor.tertiarySystemBackground))
                .clipShape(Capsule())
                .onSwipe(isHidden: calendar.selectedMeal == meal) {
                    Button {
                        print("Edited")
                        calendar.selectedMeal = meal
                        calendar.state = .editing
                    } label: {
                        Image(systemName: "pencil.line")
                            .imageScale(.large)
                    }
                    .buttonStyle(.regular)
                    
                    Button {
                        print("Deleted")
                        calendar.selectedMeal = meal
                        calendar.delete(meal)
                    } label: {
                        Image(systemName: "trash")
                            .imageScale(.large)
                    }
                    .buttonStyle(.destructive)
                }
                
            }
        }
    }
}

#Preview {
    MLMealCellView(
        meal: MLMeal(
            dateId: "22_05_23",
            type: .dinner,
            dish: MLDish(title:"Palack Panir")),
        mealType: .dinner)
        .environment(\.calendarEnvironmentValue, MLCalendar())
}
