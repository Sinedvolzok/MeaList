//
//  MLDay.swift
//  MeaList
//
//  Created by Denis Kozlov on 13.05.2024.
//

import Foundation

struct MLDay {
    let date: Date
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
}
