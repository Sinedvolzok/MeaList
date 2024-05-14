//
//  MLContainer.swift
//  MeaList
//
//  Created by Denis Kozlov on 06.05.2024.
//

import Foundation

protocol MLSection: Identifiable {
    var title: String { get }
    static func getCurrentWeek(for date: Date) -> String
}

protocol MLCell: Identifiable {
    var sectionId: String { get }
    var title: String { get }
}

protocol MLDate: MLCell {
    var date: Date { get }
}

struct MLMeal: Identifiable  {
    let id = UUID()
    let dateId: String
    let type: MLMealType
    //let dishes: [DishData]
}
enum MLMealType : String, CaseIterable{
    case breakfast
    case lunch
    case dinner
    case elevenses
}




///SectionProtocol
///- id: String
///- sectionToScroll: String
///- cells: [CellProtocol]
///
///CellProtocol
///-
///
///ContentProtocol




