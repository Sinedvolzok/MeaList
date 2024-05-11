//
//  MLContainer.swift
//  MeaList
//
//  Created by Denis Kozlov on 06.05.2024.
//

import Foundation

protocol MLSection: Identifiable {
    static var sectionToScroll: String { get }
    var title: String { get }
}

protocol MLCell: Identifiable {
    var sectionId: String { get }
    var title: String { get }
}

protocol MLDate: MLCell {}







///SectionProtocol
///- id: String
///- sectionToScroll: String
///- cells: [CellProtocol]
///
///CellProtocol
///-
///
///ContentProtocol




