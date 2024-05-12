//
//  MLSectionTests.swift
//  MeaListTests
//
//  Created by Denis Kozlov on 12.05.2024.
//

import XCTest
@testable import MeaList

final class MLWeekTests: XCTestCase {
    private var mockNow: Date!
    private var mockDate: Date!
    private var mockStartWeek: Date!
    private var mockEndWeek: Date!
    private var mockStart: Date!
    private var mockEnd: Date!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockNow = Date(timeIntervalSince1970: 1589101200)
        // date is 2020-05-10 09:00:00 +0000 UTC SUNDAY week 19
        mockDate = Date(timeIntervalSince1970: 1589533200)
        // date is 2020-05-15 09:00:00 +0000 UTC FRIEDAY week 20
        mockStartWeek = Date(timeIntervalSince1970: 1589187600)
        // date is 2020-05-11 09:00:00 +0000 UTC MONDAY week 20
        mockEndWeek = Date(timeIntervalSince1970: 1589792400)
        // date is 2020-05-18 09:00:00 +0000 UTC MONDAY week 21
        mockStart = Date(timeIntervalSince1970: 1525942800)
        // date is 2018-05-10 09:00:00 +0000 UTC
        mockEnd = Date(timeIntervalSince1970: 1620637200)
        // date is 2021-05-10 09:00:00 +0000 UTC
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        mockNow = nil
        mockDate = nil
        mockStartWeek = nil
        mockEndWeek = nil
        mockStart = nil
        mockEnd = nil
    }

    func testCurrentWeekGotten() throws {
        let sut = MLWeek.getCurrentWeek(for: mockNow)
        XCTAssertEqual("202019", sut)
    }
    func testCurrentWeekIdGotten() throws {
        let sut = MLWeek(date: mockDate).id
        XCTAssertEqual("202020", sut)
    }
    func testCurrentWeekTitleGotten() throws {
        let sut = MLWeek(date: mockDate).title
        XCTAssertEqual("WEEK 20", sut)
    }
    func testWeekdaysGotten() throws {
        let dayDurationInSeconds: TimeInterval = 60*60*24
        var mockDates: [MLDay] = []
        for date in stride(from: mockStartWeek,
                           to: mockEndWeek,
                           by: dayDurationInSeconds) {
            mockDates.append(MLDay(date: date))
        }
        let mockDays = mockDates.map(\.id)
        let sut = MLWeek(date: mockStartWeek)
            .getWeekdays(from: mockNow).map(\.id)
        XCTAssertEqual(mockDays.first, sut.first)
        XCTAssertEqual(mockDays.last, sut.last)
        XCTAssertEqual(mockDays.count, sut.count)
        XCTAssertEqual(mockDays, sut)
    }
    func testWeeksGotten() throws {
        let weekDurationInSeconds: TimeInterval = 60*60*24*7
        var mockWeeks: [String] = []
        for date in stride(from: mockStart, to: mockEnd, by: weekDurationInSeconds) {
            guard let weekNum = Int(date.week) else { return }
            mockWeeks.append(weekNum<10 ? "\(date.year)0\(date.week)" : "\(date.year)\(date.week)")
        }
        let sut = MLWeek.getWeeks(for: mockNow)
        XCTAssertEqual(mockWeeks.first, sut.first)
        XCTAssertEqual(mockWeeks.last, sut.last)
        XCTAssertEqual(mockWeeks.count, sut.count)
        XCTAssertEqual(mockWeeks, sut)
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
