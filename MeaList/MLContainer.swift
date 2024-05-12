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

protocol MLDate: MLCell {}

struct MLWeek {
    var date: Date
}
extension MLWeek: MLSection {
    var title: String { "WEEK " + date.week }
    var id: String { date.weekId }
    static func getCurrentWeek(for date: Date = .now) -> String {
        date.weekId
    }
    static func getWeeks(for date: Date = .now) -> [String] {
        Date.getWeeksRange(from: date)
    }
}
extension MLWeek {
    func getWeekdays(from date: Date = .now) -> [MLDay] {
        let dates = Date.getDatesRange(from: date)
            .filter{$0.weekId == self.id}
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




