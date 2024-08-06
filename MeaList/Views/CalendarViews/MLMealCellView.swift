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
    @Binding var selectedDishId: UUID?
    var body: some View {
        let isSelected = meal.dish.id == selectedDishId
        HStack(spacing: 16) {
            if meal.type == mealType {
                HStack {
                    Text(meal.dish.title)
                    Spacer()
                }
                .padding()
                .background(isSelected ?
                            Color(UIColor.quaternarySystemFill)
                            :
                                Color(UIColor.tertiarySystemBackground))
                .clipShape(Capsule())
                .onSwipe {
                    Button {
                        print("Edited")
//                        AddingMealView(isLeaveView: $isAddMealTapped, selectedId: $selectedId)
                    } label: {
                        Image(systemName: "pencil.line")
                            .imageScale(.large)
                    }
                    .buttonStyle(.regular)
                    
                    Button {
                        print("Deleted")
                        calendar.delete(meal)
                    } label: {
                        Image(systemName: "trash")
                            .imageScale(.large)
                    }
                    .buttonStyle(.destructive)
                }
                
            }
        }
        .padding(.leading, isSelected ? -8:0)
    }
}

//#Preview {
    //MLMealCellView(calendar: <#T##arg#>, meal: <#T##MLMeal#>, mealType: <#T##MLMealType#>, selectedDishId: <#T##UUID?#>)
//}
