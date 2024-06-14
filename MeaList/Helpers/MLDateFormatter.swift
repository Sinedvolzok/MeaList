//
//  MLDateFormatter.swift
//  MeaList
//
//  Created by Denis Kozlov on 14.06.2024.
//
import Foundation

final class MLDateFormatter: DateFormattable {
    static let shared = MLDateFormatter()
    let dateFormat: String = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    let dateStyle: DateFormatter.Style = .medium
    let timeStyle: DateFormatter.Style = .short
}

// MARK: - Protocol
protocol DateFormattable {
    var dateFormat: String { get }
    var dateStyle: DateFormatter.Style { get }
    var timeStyle: DateFormatter.Style { get }
}

// MARK: - Extension
extension DateFormattable {
    var getValue: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.timeZone = .current
        return formatter
    }
    var setValue: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter
    }
    func format(from date: String?) -> String {
        guard let date else { return "Unknown date" }
        guard let dateToFormat = getValue.date(from: date)
        else { return "Unknown format" }
        let createdString = setValue.string(from: dateToFormat)
        return createdString
    }
    
    func getDate(from id: String) -> Date? {
        let noonString = id + "T12:00:00-00:00"
        guard let noonDate = getValue.date(from: noonString) else { return nil }
        return noonDate
    }
}
