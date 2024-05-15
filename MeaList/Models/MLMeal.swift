//
//  MLMeal.swift
//  MeaList
//
//  Created by Denis Kozlov on 14.05.2024.
//

import Foundation

struct MLMeal: Identifiable  {
    let id: UUID
    let dateId: String
    let type: MLMealType
    init(id: UUID = UUID(), dateId: String, type: MLMealType) {
        self.id = id
        self.dateId = dateId
        self.type = type
    }
}
enum MLMealType : String, CaseIterable{
    case breakfast
    case lunch
    case dinner
    case elevenses
}

extension MLMeal {
    func getDishes(from data: [MLDish]) -> [MLDish] {
        data.filter{ $0.mealId == id }
    }
}
