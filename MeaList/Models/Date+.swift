//
//  Date+.swift
//  MeaList
//
//  Created by Denis Kozlov on 07.05.2024.
//

import Foundation

extension Date {
    ///Return range of formatted weeks from THURSDAY with 2 years before and 1 yaer after current date
    static func getWeeksRange(from date: Date = .now) -> [Date] {
        let thursdays = getDatesRange(from: date).filter{$0.weekday == "THURSDAY"}
        return thursdays
    }
    ///Return range of dates with 2 years before and 1 yaer after current date
    static func getDatesRange(from date: Date = .now) -> [Date] {
        let calendar = Calendar.current
        
        guard
            let initial = calendar
                .date(byAdding: .year, value: -2, to: date),
            let final = calendar
                .date(byAdding: .year, value: 1, to: date),
            let daysCount = calendar
                .dateComponents([.day], from: initial, to: final).day
        else { return [] }
        
        let dates: [Date] = (0..<daysCount).compactMap(addDate)
        
        func addDate(by value: Int) -> Date? {
            Calendar.current.date(byAdding: .day, value: value, to: initial)
        }
        return dates
    }
}

extension Date: Describable, Identifiable {
    
    var weekday: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        let weekday = formatter.string(from: self).uppercased()
        return weekday
    }
    
    var week: String {
        let week = formatted(Date.FormatStyle().week())
        return week
    }
    
    var month: String {
        let month = formatted(Date.FormatStyle().month())
        return month
    }
    
    var year: String {
        let year = formatted(Date.FormatStyle().year())
        return year
    }
    
    var day: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd"
        let day = formatter.string(from: self).uppercased()
        return day
    }
    
    public var id: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let day = formatter.string(from: self)
        return day
    }
    
    public var weekId: String {
        let week = self.week
        guard let weekNumber = Int(week) else { return "" }
        let weekFormatted =  weekNumber<10 ? "0"+week : week
        let weekId = self.year + weekFormatted
        return weekId
    }
}

protocol Describable {
    var day: String { get }
    var month: String { get }
    var week: String { get }
    var weekday: String { get }
    var year: String { get }
}
