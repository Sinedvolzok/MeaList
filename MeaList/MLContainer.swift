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

struct MLWeek {
    var date: Date
}
extension MLWeek: MLSection {
    static let sectionToScroll: String = {
        Date.now.weekId
    }()
    static let sections: [String] = {
        Date.getWeeksRange()
    }()
    var title: String { date.week }
    var id: String { date.weekId }
}
extension MLWeek {
    var days: [MLDay] {
        let dates = Date.getDatesRange().filter{$0.weekId == date.weekId}
        return dates.map(MLDay.init)
    }
}

struct MLDay {
    let date: Date
}
extension MLDay: MLDate {
    var sectionId: String { date.weekId }
    var title: String { date.day }
    var id: String { date.id }
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




