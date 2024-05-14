//
//  MLDateTest.swift
//  MeaListTests
//
//  Created by Denis Kozlov on 13.05.2024.
//

import XCTest
@testable import MeaList

final class MLDateTest: XCTestCase {
    
    private var mockDate: Date!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockDate = Date(timeIntervalSince1970: 1589101200)
        // date is 2020-05-10 09:00:00 +0000 UTC SUNDAY week 19
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        mockDate = nil
    }
    
    func testSectionIdGotten() throws {
        let sut = MLDay(date: mockDate).date.weekId
        XCTAssertEqual("202019", sut)
    }

    func testTitleGotten() throws {
        let sut = MLDay(date: mockDate).title
        XCTAssertEqual("MAY 10", sut)
    }
    
    func testIdGotten() throws {
        let sut = MLDay(date: mockDate).date.id
        XCTAssertEqual("20_05_10", sut)
    }
    
    func testMealGotten() throws {
        let day = MLDay(date: mockDate)
        let meals = day.getMeals(from: MLMeal.mokedData)
        let mealsStrings = meals.map(\.type.rawValue)
        let testMeals = ["dinner","breakfast","lunch"]
        XCTAssertEqual(testMeals.first!, meals.first!.type.rawValue)
        XCTAssertEqual(testMeals.last!, meals.last!.type.rawValue)
        XCTAssertEqual(testMeals.count, meals.count)
        XCTAssertEqual(testMeals, mealsStrings)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
