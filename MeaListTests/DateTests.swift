//
//  DateTests.swift
//  MeaListTests
//
//  Created by Denis Kozlov on 07.05.2024.
//

import XCTest
@testable import MeaList

final class DateTests: XCTestCase {
    
    private var mockNow: Date!
    private var mockThursday: Date!
    private var mockStart: Date!
    private var mockEnd: Date!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockNow = Date(timeIntervalSince1970: 1589101200)
        // date is 2020-05-10 09:00:00 +0000 UTC SUNDAY week 19
        mockThursday = Date(timeIntervalSince1970: 1588842000)
        // date is 2020-05-07 09:00:00 +0000 UTC THURSDAY week 19
        mockStart = Date(timeIntervalSince1970: 1525942800)
        // date is 2018-05-10 09:00:00 +0000 UTC
        mockEnd = Date(timeIntervalSince1970: 1620637200)
        // date is 2021-05-10 09:00:00 +0000 UTC
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        mockNow = nil
        mockThursday = nil
        mockStart = nil
        mockEnd = nil
    }
    
    func testYearFormat() throws {
        let sut = mockNow.year
        XCTAssertEqual("2020", sut)
    }
    
    func testWeekFormat() throws {
        let sut = mockNow.week
        XCTAssertEqual("19", sut)
    }
    
    func testWeekdayFormat() throws {
        let sut = mockNow.weekday
        XCTAssertEqual("SUNDAY", sut)
    }
    
    func testDayFormat() throws {
        let sut = mockNow.day
        XCTAssertEqual("MAY 10", sut)
    }
    
    func testIdFormat() throws {
        let sut = mockNow.id
        XCTAssertEqual("20_05_10", sut)
    }
    
    func testWeekIdFormat() throws {
        let sut = mockNow.weekId
        XCTAssertEqual("202019", sut)
    }
    
    func testRangeDays() throws {
        let dayDurationInSeconds: TimeInterval = 60*60*24
        var mockDates: [Date] = []
        for date in stride(from: mockStart, to: mockEnd, by: dayDurationInSeconds) {
            mockDates.append(date)
        }
        let sut = Date.getDatesRange(from: mockNow)
        XCTAssertEqual(mockDates.first, sut.first)
        XCTAssertEqual(mockDates.last, sut.last)
        XCTAssertEqual(mockDates.count, sut.count)
        XCTAssertEqual(mockDates, sut)
    }
    
    func testRangeWeeksWithFormat() throws {
        let weekDurationInSeconds: TimeInterval = 60*60*24*7
        var mockWeeks: [String] = []
        for date in stride(from: mockStart, to: mockEnd, by: weekDurationInSeconds) {
            guard let weekNum = Int(date.week) else { return }
            mockWeeks.append(weekNum<10 ? "\(date.year)0\(date.week)" : "\(date.year)\(date.week)")
        }
        let sut = Date.getWeeksRange(from: mockThursday)
        XCTAssertEqual(mockWeeks.first, sut.first)
        XCTAssertEqual(mockWeeks.last, sut.last)
        XCTAssertEqual(mockWeeks.count, sut.count)
        XCTAssertEqual(mockWeeks, sut)
    }

    func testPerformanceWeeksRange() throws {
        // This is an example of a performance test case.
        self.measure {
            let sut = Date.getWeeksRange(from: mockThursday)
        }
    }
}


