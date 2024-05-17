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




///SectionProtocol
///- id: String
///- sectionToScroll: String
///- cells: [CellProtocol]
///
///CellProtocol
///-
///
///ContentProtocol




