//
//  MLWeek.swift
//  MeaList
//
//  Created by Denis Kozlov on 13.05.2024.
//

import Foundation

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
