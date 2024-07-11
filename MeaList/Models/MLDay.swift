//
//  MLDay.swift
//  MeaList
//
//  Created by Denis Kozlov on 13.05.2024.
//

import Foundation

@Observable
class MLDay {
    let date: Date
    var meals: [MLMeal]
    
    init(date: Date, meals: [MLMeal] = []) {
        self.date = date
        self.meals = meals
    }
}

extension MLDay: Hashable {
    static func == (lhs: MLDay, rhs: MLDay) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension MLDay: MLDate {
    var sectionId: String { date.weekId }
    var title: String { date.day }
    var id: String { date.id }
}

extension MLDay {
    func getMeals(from data: [MLMeal]) -> [MLMeal] {
        data.filter{ $0.dateId == date.id }
    }
    
    func isOn(this date: Date) -> Bool {
        self.date.id == date.id
    }
}
