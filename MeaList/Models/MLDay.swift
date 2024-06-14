//
//  MLDay.swift
//  MeaList
//
//  Created by Denis Kozlov on 13.05.2024.
//

import Foundation

struct MLDay {
    let date: Date
    var meals: [MLMeal]
    
    init(date: Date, meals: [MLMeal] = []) {
        self.date = date
        self.meals = meals
    }
    
    //init(id: String) {
        
        //self.init(date: <#T##Date#>)
    //}
}

extension MLDay: Hashable {
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
