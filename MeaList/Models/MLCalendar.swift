//
//  File.swift
//  MeaList
//
//  Created by Denis Kozlov on 12.07.2024.
//

import Foundation
import SwiftUI
import Observation


@Observable
class MLCalendar {
    var days: Set<MLDay> = []
    var selectedDay: MLDay?
    var selectedMeal: MLMeal?
    var state: MLCalendarViewState = .viewing
    func add(to day: MLDay?, with data: (type: MLMealType, name: String)) -> Void {
        
        guard let day else { return }
        let dish = MLDish(title: data.name)
        let meal = MLMeal(dateId: day.id,
                          type: data.type,
                          dish: dish)
        guard let date = MLDateFormatter.shared.getDate(from: day.id)
        else { return }
        
        if let existDay = days.first(where: {$0.date.id == date.id}) {
            existDay.meals.append(meal)
        } else {
            let day = MLDay(date: date)
            day.meals.append(meal)
            days.insert(day)
        }
    }
    func edit(_ meal: MLMeal, with data: (type: MLMealType, name: String)) -> Void {
        meal.type = data.type
        meal.dish.title = data.name
    }
    func delete(_ meal: MLMeal) -> Void {
        guard let selectedDay = days.first(where: {$0.meals.contains(meal)} )
        else { return }
        selectedDay.meals.removeAll(where: {$0 == meal})
    }
}



extension EnvironmentValues {
    var calendarEnvironmentValue: MLCalendar {
        get { self[MLCalendarKey.self] }
        set { self[MLCalendarKey.self] = newValue }
    }
}

private struct MLCalendarKey: EnvironmentKey {
    static var defaultValue: MLCalendar = MLCalendar()
}
