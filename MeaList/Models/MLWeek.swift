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
extension MLWeek: MLSection, Identifiable {
    var title: String { "WEEK " + date.week }
    var id: String { date.weekId }
    static func getCurrentWeek(for date: Date = .now) -> String {
        date.weekId
    }
    static func getWeeks(for date: Date = .now) -> [MLWeek] {
        Date.getWeeksRange(from: date).map(MLWeek.init)
    }
}
extension MLWeek {
    func getWeekdays(from date: Date = .now) -> [Date] {
        let dates = Date.getDatesRange(from: date)
            .filter{$0.weekId == self.id}
        return dates
    }
}
