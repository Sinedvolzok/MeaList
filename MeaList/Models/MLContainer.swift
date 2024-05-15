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

struct MLDish {
    let id: UUID
    let mealId: UUID
    let title: String
    init(id: UUID = UUID(), mealId: UUID, title: String) {
        self.id = id
        self.mealId = mealId
        self.title = title
    }
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




