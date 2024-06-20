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
    let dish: MLDish
    init(id: UUID = UUID(), dateId: String, type: MLMealType, dish: MLDish) {
        self.id = id
        self.dateId = dateId
        self.type = type
        self.dish = dish
    }
}

extension MLMeal: Equatable {
    static func ==(lhs: MLMeal, rhs: MLMeal) -> Bool {
        lhs.id == rhs.id
    }
}

enum MLMealType: String {
    case breakfast
    case lunch
    case dinner
    case elevenses
}

extension MLMealType: Identifiable, CaseIterable {
    var id: String {
        self.rawValue
    }
}

extension MLMealType {
    var image: String {
        switch self {
        case .breakfast:
            "sun.dust.fill"
        case .lunch:
            "sun.max.fill"
        case .dinner:
            "sun.haze"
        case .elevenses:
            "carrot"
        }
    }
}
